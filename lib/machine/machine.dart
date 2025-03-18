import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class MachineEvent<Result> {
  final Completer<Result> completer;

  MachineEvent({ required this.completer });
}

class StartupMachineEvent extends MachineEvent<void> {
  StartupMachineEvent(): super(
    completer: Completer<void>()
  );
}

class SoftError implements Exception {
  final String message; 

  SoftError({ required this.message });

  SoftError.stateCannotConsumeEvent(
    MachineBaseState state,
    MachineEvent event
  ): this(
    message:'${state.runtimeType} ${event.runtimeType}'
  );
}

abstract class MachineBaseState {
  late final Machine _machine;

  MachineBaseState(Machine machine): _machine = machine;

  @protected
  Future<void> onEnter() async {}

  @protected
  Future<void> onExit() async {}

  @protected
  Future<void> onStartupEvent(StartupMachineEvent event) async {  }

  @protected
  Future<void> handleSoftError(SoftError error, StackTrace stackTrace) async {
    log('Soft Error:', error: error, stackTrace: stackTrace);
  }

  @protected
  Future<void> handleHardError(Object error, StackTrace stackTrace) async {
    log('Hard Error:', error: error, stackTrace: stackTrace);
  }

  @protected
  Future<void> setState(MachineBaseState state) async {
    await _machine.setState(state);
  }
}

abstract class Machine<T extends MachineBaseState> extends ValueNotifier<T>{
  final StreamController<SoftError> _softErrorStreamController = StreamController.broadcast();
  final StreamController<MachineEvent<dynamic>> _eventStream = StreamController(); 
  
  Machine({ required T initialState }): super(initialState) {
    _process();
  }

  Stream<SoftError> get softErrorStream => _softErrorStreamController.stream;

  @protected
  Future<void> setState(T newState) async {
    await value.onExit();
    value = newState;
    await value.onEnter();
    notifyListeners();
  }

  Future<void> _process() async {
    await for (final event in _eventStream.stream) {
      while (true) {
        T originalState = value;
        try {
          event.completer.complete(processEvent(event));
          break;
        } on SoftError catch (error, stackTrace) {
          value = originalState;
          value.handleSoftError(error, stackTrace);
          _softErrorStreamController.add(error);
          break;
        } catch (error, stackTrace) {
          value.handleHardError(error, stackTrace);
          await Future.delayed(Duration(seconds: 1));
        }
      }
    }
  }

  @protected
  Future<Result> processEvent<Result>(MachineEvent<Result> event) async {
    switch (event) {
      case StartupMachineEvent():
        return await value.onStartupEvent(event as StartupMachineEvent) as Result;
      default:
        throw SoftError.stateCannotConsumeEvent(value, event);
    }
  }
}


abstract class Node {
  final Node? nextNode;

  Node({ this.nextNode });

  List<Node> getChildren() {
    if (nextNode != null) {
      return <Node>[
        ...nextNode!.getChildren()
      ];
    } else {
      return <Node>[];
    }
  }
}
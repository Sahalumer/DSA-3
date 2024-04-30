class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinaryTree {
  Node? root;
  insert(int data) {
    Node newNode = Node(data);
    if (root == null) {
      root = newNode;
      return;
    }
    Node? current = root;
    while (true) {
      if (data < current!.data) {
        if (current.left == null) {
          current.left = newNode;
          return;
        }
        current = current.left;
      } else {
        if (current.right == null) {
          current.right = newNode;
          return;
        }
        current = current.right;
      }
    }
  }

  toPrint() {
    toPrintHelper(root);
  }

  toPrintHelper(Node? current) {
    if (current != null) {
      String value =
          current.left == null && current.right == null ? "leaf" : "parant";
      print("$value ${current.data}");
      if (current.left != null) {
        print("left ${current.left!.data}");
      }
      if (current.right != null) {
        print('right ${current.right!.data}');
      }
      toPrintHelper(current.left);
      toPrintHelper(current.right);
    }
  }
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.insert(22);
  tree.insert(18);
  tree.insert(20);
  tree.insert(30);
  tree.insert(28);
  tree.insert(29);
  tree.insert(25);
  tree.insert(17);
  tree.insert(35);
  tree.insert(32);
  tree.insert(40);
  tree.insert(15);
  tree.insert(19);
  tree.toPrint();
}

import 'dart:collection';

class Node {
  int value;
  Node? right;
  Node? left;
  Node(this.value);
}

class BinarySearchTree {
  Node? root;
  void insert(int value) {
    Node newNode = Node(value);
    if (root == null) {
      root = newNode;
    } else {
      Node? current = root;
      while (true) {
        if (value < current!.value) {
          if (current.left == null) {
            current.left = newNode;
            break;
          }
          current = current.left;
        } else {
          if (current.right == null) {
            current.right = newNode;
            break;
          }
          current = current.right;
        }
      }
    }
  }

  bfs() {
    if (root == null) {
      return;
    } else {
      Queue<Node> queue = Queue();
      queue.addLast(root!);
      while (queue.isNotEmpty) {
        Node current = queue.removeFirst();
        print(current.value);
        if (current.left != null) {
          queue.addLast(current.left!);
        }
        if (current.right != null) {
          queue.addLast(current.right!);
        }
      }
    }
  }
}

void main() {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(15);
  tree.insert(22);
  tree.insert(33);
  tree.insert(10);
  tree.insert(13);
  tree.insert(12);
  tree.insert(8);
  tree.insert(45);
  tree.bfs();
}

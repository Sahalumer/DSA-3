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

  preOrderTravels(Node? current) {
    if (current == null)
      return;
    else {
      print(current.value);
      preOrderTravels(current.left);
      preOrderTravels(current.right);
    }
  }

  inOrderTravels(Node? current) {
    if (current == null) {
      return;
    } else {
      inOrderTravels(current.left);
      print(current.value);
      inOrderTravels(current.right);
    }
  }

  postOrderTravels(Node? current) {
    if (current == null) {
      return;
    } else {
      postOrderTravels(current.left);
      postOrderTravels(current.right);
      print(current.value);
    }
  }

  delete(int data) {
    deleteHelper(data, root, null);
  }

  deleteHelper(int data, Node? current, Node? parrent) {
    while (current != null) {
      if (data > current.value) {
        parrent = current;
        current = current.right;
      } else if (data < current.value) {
        parrent = current;
        current = current.left;
      } else {
        if (current.left != null && current.right != null) {
          current.value = getMinValue(current.right);
          deleteHelper(current.value, current.right, current);
        } else {
          if (parrent == null) {
            if (current.left != null) {
              root = current.left;
            } else {
              root = current.right;
            }
          } else {
            if (parrent.left == current) {
              if (current.right != null) {
                parrent.left = current.right;
              } else {
                parrent.left = current.left;
              }
            } else {
              if (current.right != null) {
                parrent.right = current.right;
              } else {
                parrent.right = current.left;
              }
            }
          }
        }
        break;
      }
    }
  }

  int getMinValue(Node? current) {
    if (current!.left == null) {
      return current.value;
    } else {
      return getMinValue(current.left);
    }
  }
}

void main() {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(30);
  tree.insert(15);
  tree.insert(50);
  tree.insert(10);
  tree.insert(20);
  tree.insert(8);
  tree.insert(13);
  tree.insert(45);
  tree.insert(60);
  tree.insert(35);
  tree.insert(32);
  tree.insert(40);
  tree.delete(30);
  tree.bfs();
}


// deleteNoodeifLeafNode(int value) {
//     if (root == null) {
//       return;
//     } else {
//       Node? current = root;
//       Node? parant;
//       while (current != null) {
//         if (value > current.value) {
//           parant = current;
//           current = current.right;
//         } else if (value < current.value) {
//           parant = current;
//           current = current.left;
//         } else {
//           if (current.left == null && current.right == null) {
//             if (parant == null) {
//               root = null;
//             } else if (parant.left == current) {
//               parant.left = null;
//             } else {
//               parant.right = null;
//             }
//           }
//           break;
//         }
//       }
//     }
//   }

//   deleteNodeIfHaveOneChild(int data) {
//     if (root == null) {
//       return;
//     } else {
//       Node? current = root;
//       Node? parent;
//       while (current != null) {
//         if (current.value > data) {
//           parent = current;
//           current = current.left;
//         } else if (current.value < data) {
//           parent = current;
//           current = current.right;
//         } else {
//           if (current.left == null && current.right != null) {
//             if (parent == null) {
//               root = current.right;
//             } else if (parent.left == current) {
//               parent.left = current.right;
//             } else {
//               parent.right = current.right;
//             }
//           } else if (current.left != null && current.right == null) {
//             if (parent == null) {
//               root = current.left;
//             } else if (parent.left == current) {
//               parent.left = current.left;
//             } else {
//               parent.right = current.left;
//             }
//           }
//           break;
//         }
//       }
//     }
//   }

//   void deleteNodeIfhaveBothChild(int data) {
//     if (root == null) {
//       return;
//     } else {
//       root = deleteNode(root, data);
//     }
//   }

//   Node? deleteNode(Node? root, int data) {
//     if (root == null) {
//       return root;
//     }

//     if (data < root.value) {
//       root.left = deleteNode(root.left, data);
//     } else if (data > root.value) {
//       root.right = deleteNode(root.right, data);
//     } else {
//       Node? successor = minNode(root.right);
//       if (successor != null) {
//         root.value = successor.value;
//         root.right = deleteNode(root.right, successor.value);
//       }
//     }

//     return root;
//   }

//   Node? minNode(Node? node) {
//     Node? current = node;
//     while (current != null && current.left != null) {
//       current = current.left;
//     }
//     return current;
//   }

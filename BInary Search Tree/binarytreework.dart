class TreeNode {
  int data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);
}

class BinaryTreeWork {
  TreeNode? root;
  insert(int data) {
    TreeNode newNode = TreeNode(data);
    if (root == null) {
      root = newNode;
    } else {
      TreeNode? current = root;
      while (true) {
        if (data < current!.data) {
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

  remove(int data) {
    _removeHelper(data, root, null);
  }

  _removeHelper(int data, TreeNode? current, TreeNode? parrent) {
    while (current != null) {
      if (current.data > data) {
        parrent = current;
        current = current.left;
      } else if (current.data < data) {
        parrent = current;
        current = current.right;
      } else {
        if (current.left != null && current.right != null) {
          current.data = getMinValue(current.right);
          _removeHelper(current.data, current.right, current);
        } else {
          if (parrent == null) {
            if (current.left != null) {
              root = current.left;
            } else {
              root = current.right;
            }
          } else {
            if (parrent.left != null) {
              if (current.left != null) {
                parrent.left = current.left;
              } else {
                parrent.right = current.right;
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

  int getMinValue(TreeNode? current) {
    if (current!.left == null) {
      return current.data;
    } else {
      return getMinValue(current.left);
    }
  }

  bfs() {
    if (root == null) {
      return;
    } else {
      List<TreeNode> queue = [];
      queue.add(root!);
      while (queue.isNotEmpty) {
        TreeNode current = queue.removeAt(0);
        print(current.data);
        if (current.left != null) {
          queue.add(current.left!);
        }
        if (current.right != null) {
          queue.add(current.right!);
        }
      }
    }
  }

  inorderTravels(TreeNode? current) {
    if (current == null) {
      return;
    } else {
      inorderTravels(current.left);
      print(current.data);
      inorderTravels(current.right);
    }
  }

  preOrderTravels(TreeNode? current) {
    if (current == null) {
      return null;
    } else {
      print(current.data);
      preOrderTravels(current.left);
      preOrderTravels(current.right);
    }
  }

  postOrderTravels(TreeNode? current) {
    if (current == null) {
      return;
    } else {
      preOrderTravels(current.left);
      preOrderTravels(current.right);
      print(current.data);
    }
  }
}

void main() {
  BinaryTreeWork tree = BinaryTreeWork();
  tree.insert(50);
  tree.insert(25);
  tree.insert(10);
  tree.insert(5);
  tree.insert(15);
  tree.insert(35);
  tree.insert(40);
  tree.insert(60);
  tree.insert(65);
  tree.insert(80);
  tree.insert(75);
  tree.insert(70);
  tree.insert(90);
  tree.postOrderTravels(tree.root);
}

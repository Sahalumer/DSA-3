class MinHeapString {
  List<String> heapStr = [];
  insert(String value) {
    heapStr.add(value);
    heapifyUp(heapStr.length - 1);
  }

  remove() {
    heapStr[0] = heapStr.removeLast();
    heapifyDown(0);
  }

  printHeap() {
    print(heapStr);
  }

  heapifyUp(int child) {
    while (child > 0) {
      int parant = _parant(child);
      if (heapStr[parant].length > heapStr[child].length) {
        _swap(parant, child);
        child = parant;
      } else {
        break;
      }
    }
  }

  heapifyDown(int parant) {
    int left = _leftChild(parant);
    int right = _rightChild(parant);
    int smallest = parant;
    if (left < heapStr.length &&
        heapStr[left].length < heapStr[smallest].length) {
      smallest = left;
    }
    if (right < heapStr.length &&
        heapStr[right].length < heapStr[smallest].length) {
      smallest = right;
    }
    if (smallest != parant) {
      _swap(smallest, parant);
      heapifyDown(smallest);
    }
  }

  int _parant(int child) {
    return (child - 1) ~/ 2;
  }

  int _leftChild(int parant) {
    return 2 * parant + 1;
  }

  int _rightChild(int parant) {
    return 2 * parant + 2;
  }

  _swap(int i, int j) {
    String temp = heapStr[i];
    heapStr[i] = heapStr[j];
    heapStr[j] = temp;
  }
}

void main() {
  MinHeapString min = MinHeapString();
  min.insert("ab");
  min.insert("abcdefg");
  min.insert("abcd");
  min.insert("a");
  min.insert("abcde");
  min.insert("abc");
  min.insert("abcdef");
  print("After insert values");
  min.printHeap();
  min.remove();
  print("After remove a value");
  min.printHeap();
}

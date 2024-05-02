class MinHeap {
  List<int> heap = [];
  insert(int value) {
    heap.add(value);
    heapifyUp(heap.length - 1);
  }

  remove() {
    heap[0] = heap.removeLast();
    heapifyDown(0);
  }

  printHeap() {
    print(heap);
  }

  heapifyUp(int child) {
    while (child > 0) {
      int parant = _parant(child);
      if (heap[parant] > heap[child]) {
        _swap(parant, child);
        child = parant;
      } else {
        break;
      }
    }
  }

  heapifyDown(int parant) {
    int left = leftChild(parant);
    int rigth = rightChild(parant);
    int smallest = parant;
    if (left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }
    if (rigth < heap.length && heap[rigth] < heap[smallest]) {
      smallest = rigth;
    }
    if (smallest != parant) {
      _swap(smallest, parant);
      heapifyDown(smallest);
    }
  }

  int _parant(int child) {
    return (child - 1) ~/ 2;
  }

  int leftChild(int parant) {
    return 2 * parant + 1;
  }

  int rightChild(int parant) {
    return 2 * parant + 2;
  }

  _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  MinHeap min = MinHeap();
  min.insert(25);
  min.insert(61);
  min.insert(75);
  min.insert(33);
  min.insert(15);
  min.insert(22);
  min.insert(46);
  print("after inserting value");
  min.printHeap();
  min.remove();
  print("after remove a value");
  min.printHeap();
}

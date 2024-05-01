class MaxHeap {
  List<int> heap = [];
  insert(int value) {
    heap.add(value);
    heapifyUp(heap.length - 1);
  }

  heapifyUp(int index) {
    while (index > 0) {
      int parent = _parent(index);
      if (heap[parent] < heap[index]) {
        _swap(parent, index);
        index = parent;
      } else {
        break;
      }
    }
  }

  remove() {
    heap[0] = heap.removeLast();
    heapifyDown(0);
  }

  heapifyDown(int parant) {
    int left = _leftChild(parant);
    int right = _rigthChild(parant);
    int largest = parant;
    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }
    if (right < heap.length && heap[right] > heap[largest]) {
      largest = right;
    }
    if (largest != parant) {
      _swap(parant, largest);
      heapifyDown(largest);
    }
  }

  _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  int _parent(int value) {
    return (value - 1) ~/ 2;
  }

  int _leftChild(int parant) {
    return 2 * parant + 1;
  }

  int _rigthChild(int parant) {
    return 2 * parant + 2;
  }

  printHeap() {
    print(heap);
  }
}

void main() {
  MaxHeap max = MaxHeap();
  max.insert(25);
  max.insert(30);
  max.insert(50);
  max.insert(15);
  max.insert(10);
  max.insert(20);
  max.remove();
  max.printHeap();
}

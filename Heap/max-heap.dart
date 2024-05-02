class MaxHeap {
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
      if (heap[parant] < heap[child]) {
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
    int largest = parant;
    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }
    if (right < heap.length && heap[right] > heap[largest]) {
      largest = right;
    }
    if (largest != parant) {
      _swap(largest, parant);
      heapifyDown(largest);
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
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  MaxHeap max = MaxHeap();
  max.insert(25);
  max.insert(61);
  max.insert(72);
  max.insert(33);
  max.insert(17);
  max.insert(10);
  max.insert(5);
  print("After inserting data ");
  max.printHeap();
  max.remove();
  print("After remove a value");
  max.printHeap();
}

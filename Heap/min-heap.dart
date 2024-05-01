import 'dart:io';

class MinHeap {
  List<int> heap = [];

  insert(int value) {
    heap.add(value);
    ShifUp(heap.length - 1);
  }

  remove() {
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    shiftDown(0);
  }

  ShifUp(int index) {
    while (index > 0) {
      int parant = _parant(index);
      if (heap[index] < heap[parant]) {
        _swap(index, parant);
        index = parant;
      } else {
        break;
      }
    }
  }

  shiftDown(int parent) {
    int leftChild = _leftChild(parent);
    int rightChild = _rightChild(parent);
    int smallest = parent;

    if (leftChild < heap.length && heap[leftChild] < heap[smallest]) {
      smallest = leftChild;
    }
    if (rightChild < heap.length && heap[rightChild] < heap[smallest]) {
      smallest = rightChild;
    }

    if (smallest != parent) {
      _swap(smallest, parent);
      shiftDown(smallest);
    }
  }

  int _parant(int valueIndex) {
    return (valueIndex - 1) ~/ 2;
  }

  int _leftChild(int valueIndex) {
    return 2 * valueIndex + 1;
  }

  int _rightChild(int valueIndex) {
    return 2 * valueIndex + 2;
  }

  _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  printHeap() {
    print(heap);
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.insert(15);
  minHeap.insert(25);
  minHeap.insert(35);
  minHeap.insert(28);
  minHeap.insert(10);
  minHeap.insert(5);
  minHeap.remove();
  minHeap.printHeap();
}

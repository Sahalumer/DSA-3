class MinHeapWork {
  List<int> minHeap = [];
  insert(int value) {
    minHeap.add(value);
    heapifyup(minHeap.length - 1);
  }

  remove() {
    minHeap[0] = minHeap.removeLast();
    heapifydown(0);
  }

  heapifyup(int child) {
    while (child > 0) {
      int parrent = parant(child);
      if (minHeap[child] < minHeap[parrent]) {
        swap(child, parrent);
        child = parrent;
      } else {
        break;
      }
    }
  }

  heapifydown(int parant) {
    int left = leftChild(parant);
    int right = rightChild(parant);
    int smallest = parant;
    if (left < minHeap.length && minHeap[left] < minHeap[smallest]) {
      smallest = left;
    }
    if (right < minHeap.length && minHeap[right] < minHeap[smallest]) {
      smallest = right;
    }
    if (smallest != parant) {
      swap(smallest, parant);
      heapifydown(smallest);
    }
  }

  swap(int i, int j) {
    int temp = minHeap[i];
    minHeap[i] = minHeap[j];
    minHeap[j] = temp;
  }

  int parant(int child) {
    return (child - 1) ~/ 2;
  }

  int leftChild(int parrent) {
    return 2 * parrent + 1;
  }

  int rightChild(int parant) {
    return 2 * parant + 2;
  }

  display() {
    print(minHeap);
  }
}

void main() {
  MinHeapWork min = MinHeapWork();
  min.insert(25);
  min.insert(61);
  min.insert(75);
  min.insert(33);
  min.insert(15);
  min.insert(22);
  min.insert(46);
  print("after inserting value");
  min.display();
  min.remove();
  print("after remove a value");
  min.remove();
  min.display();
}

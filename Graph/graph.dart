import 'dart:collection';

class Graph {
  Map<int, List<int>> graph = {};

  insert(int vertix, int edge, [bool isbidirectional = false]) {
    if (!graph.containsKey(vertix)) {
      graph[vertix] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertix]!.add(edge);
    if (isbidirectional) {
      graph[edge]!.add(vertix);
    }
  }

  bfs(int vertix) {
    Set<int> visited = {};
    List<int> que = [];

    visited.add(vertix);
    que.add(vertix);
    while (que.isNotEmpty) {
      int current = que.removeAt(0);
      for (var i in graph[current]!) {
        if (!visited.contains(i)) {
          visited.add(i);
          que.add(i);
        }
      }
    }
    print(visited);
  }

  bfsAll() {
    Set<int> visited = {};
    Queue<int> queue = Queue();

    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        queue.add(vertex);
        visited.add(vertex);
        while (queue.isNotEmpty) {
          int current = queue.removeFirst();
          for (int i in graph[current]!) {
            if (!visited.contains(i)) {
              visited.add(i);
              queue.add(i);
            }
          }
        }
      }
    });
    print(visited);
  }

  dfsAll() {
    Set<int> visited = {};
    List<int> stack = [];

    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        stack.add(vertex);
        while (stack.isNotEmpty) {
          int current = stack.removeAt(stack.length - 1);
          if (!visited.contains(current)) {
            visited.add(current);

            graph[current]!.forEach((neighbor) {
              if (!visited.contains(neighbor)) {
                stack.add(neighbor);
              }
            });
          }
        }
      }
    });
    print(visited);
  }

  void display() {
    graph.forEach((key, vertix) {
      print('$key:$vertix');
    });
  }
}

void main() {
  Graph graph = Graph();
  graph.insert(11, 22, true);
  graph.insert(11, 44, true);
  graph.insert(44, 22, false);
  graph.insert(22, 45, true);
  graph.insert(45, 33, true);
  graph.insert(25, 33, true);
  graph.insert(33, 52, true);
  graph.insert(50, 52, true);
  graph.insert(68, 48, false);
  graph.insert(49, 48, true);
  graph.insert(50, 49, true);
  graph.insert(33, 25, true);
  graph.insert(44, 25, true);
  graph.display();
  graph.dfsAll();
  // graph.dfsAll();
}

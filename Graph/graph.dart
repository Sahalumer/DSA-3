class Graph {
  Map<int, List<int>> graph = {};

  insert(int vertex, int edge, bool isbidirectinal) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isbidirectinal) {
      graph[edge]!.add(vertex);
    }
  }

  void display() {
    graph.forEach((key, vertix) {
      print('$key:$vertix');
    });
  }
}

void main() {
  Graph graph = Graph();
  graph.insert(10, 15, true);
  graph.insert(11, 15, true);
  graph.insert(11, 30, true);
  graph.insert(50, 11, true);
  graph.insert(15, 20, false);
  graph.insert(30, 20, true);
  graph.insert(10, 20, false);
  graph.insert(15, 50, false);
  graph.insert(20, 35, true);
  graph.display();
}

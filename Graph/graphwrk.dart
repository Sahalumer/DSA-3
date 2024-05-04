class Graphwork {
  Map<int, List<int>> graph = {};

  insert(int vertex, int edges, [bool isbiderctional = false]) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edges)) {
      graph[edges] = [];
    }
    graph[vertex]!.add(edges);
    if (isbiderctional) {
      graph[edges]!.add(vertex);
    }
  }

  bfs() {
    Set<int> visited = {};
    List<int> queue = [];

    graph.keys.forEach((ver) {
      if (!visited.contains(ver)) {
        queue.add(ver);
        visited.add(ver);
        while (queue.isNotEmpty) {
          int current = queue.removeAt(0);
          for (int i in graph[current]!) {
            if (!visited.contains(i)) {
              queue.add(i);
              visited.add(i);
            }
          }
        }
      }
    });
    print(visited);
  }

  dfs() {
    List<int> stack = [];
    Set<int> visited = {};

    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        stack.add(vertex);
        while (stack.isNotEmpty) {
          int current = stack.removeAt(stack.length - 1);
          if (!visited.contains(current)) {
            visited.add(current);
            graph[current]!.forEach((element) {
              if (!visited.contains(element)) {
                stack.add(element);
              }
            });
          }
        }
      }
    });
  }
}

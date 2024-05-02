class TNode {
  Map<String, TNode> character = {};
  bool end = false;
}

class Trie {
  TNode root = TNode();
  insert(String word) {
    TNode temp = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!temp.character.containsKey(char)) {
        temp.character[char] = TNode();
      }
      temp = temp.character[char]!;
    }
    temp.end = true;
  }

  bool search(String word) {
    TNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.character.containsKey(char)) {
        return false;
      }
      current = current.character[char]!;
    }
    return current.end;
  }

  bool searchStartWith(String word) {
    TNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.character.containsKey(char)) {
        return false;
      }
      current = current.character[char]!;
    }
    return true;
  }

  delete(String word) {
    _deleteHelper(root, word, 0);
  }

  bool _deleteHelper(TNode root, String word, int depth) {
    if (depth == word.length) {
      if (!root.end) {
        return false;
      }
      root.end = false;
      return root.character.isEmpty;
    }

    String char = word[depth];
    if (!root.character.containsKey(char)) {
      return false;
    }
    bool shouldDelete = _deleteHelper(root.character[char]!, word, depth + 1);
    if (shouldDelete) {
      root.character.remove(char);

      return root.character.isEmpty && !root.end;
    }
    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("sahal");
  trie.insert("umer");
  trie.insert("salman");
  trie.insert("febi");
  trie.insert("febina");
  trie.delete("febina");

  print(trie.search("febina"));
}

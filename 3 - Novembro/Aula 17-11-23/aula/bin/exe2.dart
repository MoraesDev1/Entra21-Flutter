void main() {
  Cadastros<String, int> cadastros = Cadastros<String, int>();
  cadastros.setByKey(1, 'João');
  cadastros.setByKey(2, 'Maria');

  print(cadastros.getByKey(2));
}

class Cadastros<T, K> implements Cache<T, K> {
  Map<K, T> _banco = Map();

  @override
  T? getByKey(K key) {
    return _banco[key];
  }

  @override
  void setByKey(key, value) {
    _banco[key] = value;
  }
}

abstract class Cache<T, K> {
  T? getByKey(K key);
  void setByKey(K key, T value);
}

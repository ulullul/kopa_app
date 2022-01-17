class Bundle {
  Map<String, Object> _mapa = Map();

  void putInt(String key, int value) {
    _mapa[key] = value;
  }

  void putString(String key, String value) {
    _mapa[key] = value;
  }

  void putBool(String key, bool value) {
    _mapa[key] = value;
  }

  void putDynamic(String key, Object value) {
    _mapa[key] = value;
  }

  int? getInt(String key, {int? defaultValue}) {
    if (_mapa.containsKey(key) && _mapa[key] is int) return (_mapa[key] as int);
    return defaultValue;
  }

  String? getString(String key, {String? defaultValue}) {
    if (_mapa.containsKey(key) && _mapa[key] is String)
      return (_mapa[key] as String);
    return defaultValue;
  }

  bool? getBool(String key, {bool? defaultValue}) {
    if (_mapa.containsKey(key) && _mapa[key] is bool)
      return (_mapa[key] as bool);
    return defaultValue;
  }

  T? getDynamic<T>(String key, {T? defaultValue}) {
    if (_mapa.containsKey(key) && _mapa[key] is T) return (_mapa[key] as T);
    return defaultValue;
  }
}

typedef FutureVoidCallback = Future<void> Function();
typedef FutureDynamicCallback = Future<dynamic> Function();
typedef FutureIntCallback = Future<int> Function();
typedef FutureStringCallback = Future<String> Function();
typedef FutureDoubleCallback = Future<double> Function();

typedef DynamicCallback = dynamic Function();
typedef IntCallback = int Function();
typedef StringCallback = String Function();
typedef DoubleCallback = double Function();
typedef BoolCallback = bool Function();

typedef DynamicArgCallback = void Function(dynamic arg);
typedef IntArgCallback = void Function(int arg);
typedef StringArgCallback = void Function(String arg);
typedef DoubleArgCallback = void Function(double arg);
typedef BoolArgCallback = void Function(bool arg);

typedef IntOptCallback = int? Function();
typedef StringOptCallback = String? Function();
typedef DoubleOptCallback = double? Function();
typedef BoolOptCallback = bool? Function();

typedef IntFullOptCallback = int? Function(int? arg);
typedef StringFullOptCallback = String? Function(String? arg);
typedef DoubleFullOptCallback = double? Function(double? arg);
typedef BoolFullOptCallback = bool? Function(bool? arg);

typedef Json = Map<String, dynamic>;
typedef MapSS = Map<String, String>;

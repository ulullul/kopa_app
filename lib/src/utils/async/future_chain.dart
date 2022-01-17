
import 'package:flutter_app_example/src/core/define.dart';
import 'package:flutter_app_example/src/utils/async/retry_future.dart';

class FutureChainT<T> {
  List<Future<T> Function()>? data;
  final Function(int)? onOneCompleted;
  final Function(int, dynamic, StackTrace)? onError;
  int _curIndex = 0;
  bool _isRunning = false;
  final Duration? timeout;

  FutureChainT({this.data, this.onOneCompleted, this.onError, this.timeout}) {
    if (data == null) data = [];
  }

  Future<void> add(Future<T> Function()? item) async {
    if (item == null) return;
    data?.add(item);
    await startPerformance();
  }

  Future<void> startPerformance() async {
    if (_isRunning) return;
    if (data == null) return;
    for (int i = _curIndex; i < data!.length; ++i) {
      try {
        _isRunning = true;
        if (timeout != null)
          await retry(3, data![i], timeout: timeout);
        else
          await retry(3, data![i]);
        if (onOneCompleted != null) {
          onOneCompleted!(_curIndex);
        }
        ++_curIndex;
      } catch (err, stackTrace) {
        _isRunning = false;
        if (onError != null) {
          onError!(_curIndex, err, stackTrace);
          break;
        }
      }
    }
    _isRunning = false;
  }
}

class FutureChain extends FutureChainT<void> {
  FutureChain(
      {List<FutureVoidCallback>? data,
      Function(int)? onOneCompleted,
      Function(int, dynamic, StackTrace)? onError,
      Duration? timeout})
      : super(
            data: data,
            onError: onError,
            onOneCompleted: onOneCompleted,
            timeout: timeout);
}

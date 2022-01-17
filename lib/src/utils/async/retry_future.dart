typedef Future<T> FutureGenerator<T>();
Future<T> retry<T>(int retries, FutureGenerator aFuture,
    {Duration? timeout}) async {
  try {
    if(timeout!=null)return await aFuture().timeout(timeout);
    return await aFuture();
  } catch (e) {
    if (retries > 1) {
      return retry(retries - 1, aFuture, timeout: timeout);
    }

    rethrow;
  }
}

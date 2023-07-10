import 'dart:async';

class Debouncer {
  Debouncer._();
  static Timer? _timer;

  static void run(
    void Function() action, {
    Duration duration = const Duration(milliseconds: 400),
  }) {
    if (duration == Duration.zero) {
      _timer?.cancel();
    } else {
      _timer?.cancel();
      _timer = Timer(duration, () {
        _timer?.cancel();
        action();
      });
    }
  }
}

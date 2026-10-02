import 'dart:async';
import 'dart:math';

class CounterProvider {
  final StreamController<bool> controller = StreamController<bool>();

  Random random = Random();

  CounterProvider() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      controller.add(random.nextBool());
    });
  }
}

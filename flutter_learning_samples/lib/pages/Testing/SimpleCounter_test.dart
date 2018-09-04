import 'package:test/test.dart';
import 'SimpleCounter.dart';

void main() {
  group('SimpleCounter', () {

    test('value should be incremented', () {
      final counter = new SimpleCounter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = new SimpleCounter();
      counter.decrement();
      expect(counter.value, -1);
    });

  });
}
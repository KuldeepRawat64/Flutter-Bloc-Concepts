import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'the initial state for the counterState is CountersState(counterValue:0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
        'the cubit should emit a CounterState(counterValue: 1, isIncremented: true) when increment() is called',
        build: () => counterCubit,
        act: (CounterCubit cubit) => cubit.increment(),
        expect: () => [
              CounterState(counterValue: 1, isIncremented: true),
            ]);

    blocTest(
        'the cubit should emit a CounterState(counterValue: -1, isIncremented: false) when decrement() is called',
        build: () => counterCubit,
        act: (CounterCubit cubit) => cubit.decrement(),
        expect: () => [
              CounterState(counterValue: -1, isIncremented: false),
            ]);
  });
}

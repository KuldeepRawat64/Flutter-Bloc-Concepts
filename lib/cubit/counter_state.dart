part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;
  bool? isIncremented;

  CounterState({
    required this.counterValue,
    this.isIncremented,
  });
}

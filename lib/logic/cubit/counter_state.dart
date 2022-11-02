part of 'counter_cubit.dart';

class CounterState extends Equatable {
  // Equatable used for unit testing
  final int counterValue;
  final bool? isIncremented;

  const CounterState({
    required this.counterValue,
    this.isIncremented,
  });

  CounterState copyWith({
    int? counterValue,
    bool? isIncremented,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
      isIncremented: isIncremented ?? this.isIncremented,
    );
  }

  @override
  List<Object> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'isIncremented': isIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      isIncremented:
          map['isIncremented'] != null ? map['isIncremented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

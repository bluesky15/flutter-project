import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
//part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementEvent>((event, emit) => emit(state + 1));
    on<CounterDecrementEvent>((event, emit) => emit(state - 1));
  }
}

import 'package:bloc/bloc.dart';

void main(List<String> args) {
  final cubit = CounterCubit(0);
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.close();
}

class CounterCubit extends Cubit<int> {
  CounterCubit(int initialState) : super(initialState);

  void increment() => emit(state + 1);
}

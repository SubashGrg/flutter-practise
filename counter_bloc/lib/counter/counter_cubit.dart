//cubit: simplified version of bloc for easy state management
//creating our own cubit!


import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  //increment
  void increment() => emit(state + 1);

  //decrement
  void decrement() => emit(state - 1);
}

//responsible for providing countercubit to counterview
// use blocprovider

import 'package:counter_bloc/counter/counter_cubit.dart';
import 'package:counter_bloc/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>CounterCubit(0),

    //Counter view UI
    child:CounterView()
    );
  }
}

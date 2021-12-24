import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturan_selector/cubit/color_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ColorCubit(),
        child: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            if (state is ColorDownloaded || state is ColorInitial) {
              return Container(
                color: state.color,
                child: FloatingActionButton(
                  onPressed: () {
                    context.read<ColorCubit>().changeColor();
                  },
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

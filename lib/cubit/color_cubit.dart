import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(const ColorInitial());

  void changeColor() async {
    emit(const ColorNetworkFetching());
    RandomColor _randomColor = RandomColor();
    //simulate network delay when downloading images or videos
    await Future.delayed(const Duration(seconds: 1));
    emit(ColorDownloaded(_randomColor.randomColor()));
  }
}

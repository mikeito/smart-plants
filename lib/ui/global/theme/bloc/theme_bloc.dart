import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../app_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState) {  // use saved theme at init
    on<ThemeChanged>(
      (event, emit) {
        emit(ActualThemeState(themeData: appThemeData[event.theme]));
        // save selected theme
      },
    );
  }
}

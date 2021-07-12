import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:theme_f/theme_status.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void darkTheme() => emit(ThemeDark());
  void lightTheme() => emit(ThemeLight());
  void defaultTheme(BuildContext context) => emit(ThemeSystemDefault(context));

}

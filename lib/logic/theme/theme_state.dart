part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeData themeData;
  final ThemeStatus status;

  ThemeState({required this.themeData, required this.status});
}

class ThemeInitial extends ThemeState {
  ThemeInitial()
      : super(
            themeData:ThemeData.light(),
            status: ThemeStatus.light);
}

class ThemeDark extends ThemeState {
  ThemeDark() : super(themeData: ThemeData.dark(), status: ThemeStatus.dark);
}

class ThemeLight extends ThemeState {
  ThemeLight() : super(themeData: ThemeData.light(), status: ThemeStatus.light);
}

class ThemeSystemDefault extends ThemeState {
  ThemeSystemDefault(BuildContext context)
      : super(
            themeData:
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? ThemeData.dark()
                    : ThemeData.light(),
            status: ThemeStatus.systemDefault);
}

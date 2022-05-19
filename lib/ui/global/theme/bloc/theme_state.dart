part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class ActualThemeState extends ThemeState {
  final ThemeData? themeData;

  const ActualThemeState({
    required this.themeData,
  });

  @override
  List<Object?> get props => [themeData];
}

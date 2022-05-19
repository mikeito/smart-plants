import 'package:flutter/material.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  RedLight,
  RedDark,
}

final appThemeData = {
  AppTheme.GreenLight: ThemeData(
      brightness: Brightness.light, primaryColor: const Color(0xff00B045)),
  AppTheme.GreenDark: ThemeData(
      brightness: Brightness.dark, primaryColor: const Color(0xAA00B045)),
  AppTheme.RedLight: ThemeData(
      brightness: Brightness.light, primaryColor: const Color(0xFFff0000)),
  AppTheme.RedDark: ThemeData(
      brightness: Brightness.dark, primaryColor: const Color(0xAAB30000)),
};

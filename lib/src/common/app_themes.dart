import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  //Primary
  static const Color _lightPrimaryColor = Color.fromRGBO(246, 246, 246, 1);
  static const Color _darkPrimaryColor = Color(0xFF1a222d);

  //Background
  static const Color _lightBackgroundColor = Color.fromRGBO(246, 246, 246, 1);
  static const Color _darkBackgroundColor = Color(0xFF1a222d);

  //Text
  static const Color _lightTextColor = Color(0xff000000);
  static const Color _darkTextColor = Color.fromRGBO(246, 246, 246, 1);

  //Icon
  static const Color _lightIconColor = Color(0xff000000);
  static const Color _darkIconColor = Color.fromRGBO(246, 246, 246, 1);

  //Text themes
  static const TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 96.0, color: _lightTextColor),
    headlineMedium: TextStyle(fontSize: 60.0, color: _lightTextColor),
    headlineSmall: TextStyle(fontSize: 48.0, color: _lightTextColor),
    titleLarge: TextStyle(fontSize: 34.0, color: _lightTextColor),
    titleMedium: TextStyle(fontSize: 24.0, color: _lightTextColor),
    titleSmall: TextStyle(
        fontSize: 20.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(fontSize: 16.0, color: _lightTextColor),
    labelMedium: TextStyle(
        fontSize: 14.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(
        fontSize: 12.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16.0, color: _lightTextColor),
    bodyMedium: TextStyle(fontSize: 14.0, color: _lightTextColor),
    bodySmall: TextStyle(fontSize: 12.0, color: _lightTextColor),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 96.0, color: _darkTextColor),
    headlineMedium: TextStyle(fontSize: 60.0, color: _darkTextColor),
    headlineSmall: TextStyle(fontSize: 48.0, color: _darkTextColor),
    titleLarge: TextStyle(fontSize: 34.0, color: _darkTextColor),
    titleMedium: TextStyle(fontSize: 24.0, color: _darkTextColor),
    titleSmall: TextStyle(
        fontSize: 20.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(fontSize: 16.0, color: _darkTextColor),
    labelMedium: TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(
        fontSize: 12.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16.0, color: _darkTextColor),
    bodyMedium: TextStyle(fontSize: 14.0, color: _darkTextColor),
    bodySmall: TextStyle(fontSize: 12.0, color: _darkTextColor),
  );

  ///Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: AppBarTheme(
      color: _lightBackgroundColor,
      iconTheme: const IconThemeData(color: _lightIconColor),
      toolbarTextStyle: _lightTextTheme.titleLarge,
      titleTextStyle: _lightTextTheme.titleMedium,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: _lightTextTheme.labelMedium,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: _lightTextTheme.labelMedium,
        ),
        menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(_lightBackgroundColor),
            padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)))),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //   textStyle: WidgetStatePropertyAll(_lightTextTheme.labelMedium!.copyWith(color: Colors.white)),
    //   backgroundColor:
    //       const WidgetStatePropertyAll(Color.fromRGBO(86, 148, 242, 1)),
    // )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent, // Change the background color here
      selectedItemColor: Colors.white, // Change the selected item color
      unselectedItemColor: Colors.grey, // Change the unselected item color
      elevation: 10, // Change the elevation of the bar
      type: BottomNavigationBarType.fixed,
    ),
  );

  ///Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPrimaryColor,
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: AppBarTheme(
      color: _darkBackgroundColor,
      iconTheme: const IconThemeData(color: _darkIconColor),
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    ),
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    textTheme: _darkTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: _darkTextTheme.labelMedium,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: _darkTextTheme.labelMedium,
        ),
        menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(_darkBackgroundColor),
            padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)))),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //   textStyle: WidgetStatePropertyAll(_darkTextTheme.labelMedium!.copyWith(color: Colors.white)),
    //   backgroundColor: const WidgetStatePropertyAll(_darkPrimaryColor),
    // )),
  );
}

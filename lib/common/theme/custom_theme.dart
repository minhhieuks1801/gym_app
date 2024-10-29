import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData theme = ThemeData(
    useMaterial3: true,

    ///TextTheme---------------------------------
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    ///ElevatedButton-----------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 24)),

        ///Cái này đang không hoạt động----------
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size.fromHeight(40),
        ),
        backgroundColor: const MaterialStatePropertyAll<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          (RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
        ),
      ),
    ),
  );
}

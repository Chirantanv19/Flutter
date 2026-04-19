import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 11, 207, 109),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 4, 48, 9),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),

          colorScheme: kDarkColorScheme,
          cardTheme: const CardThemeData().copyWith(
            color: Color.fromARGB(255, 27, 57, 69),
            surfaceTintColor: Colors.transparent,
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardThemeData().copyWith(
            color: kColorScheme.secondaryContainer,
            surfaceTintColor: Colors.transparent,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: TextTheme().copyWith(
            bodyMedium: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 16,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 12,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kColorScheme.onPrimary,
              fontSize: 14,
            ),
          ),
        ),
        themeMode: ThemeMode.system,
        home: Expenses(),
      ),
    );
  // });
}

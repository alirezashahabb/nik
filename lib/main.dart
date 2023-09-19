import 'package:flutter/material.dart';
import 'package:nikeshop/data/repositroy/comemnt_repositroy.dart';
import 'package:nikeshop/screens/home/home_screens.dart';
import 'package:nikeshop/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    commentRepositroy.getComment(9).then((value) {
      debugPrint(value.toString());
    }).catchError((err) {
      debugPrint(err);
    });

    const defultTextStyle = TextStyle(
      fontFamily: 'Iran',
      color: LightThemColor.primaryTetxColor,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: LightThemColor.primaryColor),

          /// this is for Colors on applictions
          textTheme: TextTheme(
            titleMedium: defultTextStyle.apply(
              color: LightThemColor.secoundrTextColor,
            ),
            labelLarge: defultTextStyle,
            bodyMedium: defultTextStyle,
            titleLarge: defultTextStyle,
            bodySmall: defultTextStyle.copyWith(
                color: LightThemColor.secoundrTextColor),
          ),
          colorScheme: const ColorScheme.light(
              primary: LightThemColor.primaryColor,
              secondary: LightThemColor.secoundrColor,
              onSecondary: Colors.white)),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreens(),
      ),
    );
  }
}

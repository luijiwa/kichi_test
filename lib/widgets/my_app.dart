import 'package:flutter/material.dart';
import 'package:lichi_test/widgets/product_list_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'OpenSans',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'OpenSans'),
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.black, // background (button) color
        //     foregroundColor: Colors.white, // foreground (text) color),
        //   ),
        // ),
      ),
      home: const ProductListWidget(),
    );
  }
}

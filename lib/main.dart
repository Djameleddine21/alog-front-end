import 'package:flutter/material.dart';
import 'package:tp_alog/views/routes/routes.dart';
import 'package:tp_alog/views/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.teal,
        backgroundColor: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
        appBarTheme: AppBarTheme(color: Colors.teal),
        primarySwatch: Colors.teal,
      ),
      title: "TP ALOG",
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: HomeScreen.id,
    );
  }
}

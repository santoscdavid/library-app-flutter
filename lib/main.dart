import 'package:flutter/material.dart';
import 'package:livraria_mobile/provider/editora_provider.dart';
import 'package:livraria_mobile/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'WDA Livraria';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
              .copyWith(secondary: Colors.deepPurpleAccent)),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (ctx) => EditoraProvider())
      ], child: const MainScreen()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:livraria_mobile/components/editora_form.dart';
import 'package:livraria_mobile/provider/editora_provider.dart';
import 'package:livraria_mobile/routes/routes.dart';
import 'package:livraria_mobile/screens/editora_screen.dart';
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
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => EditoraProvider())],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
                    .copyWith(secondary: Colors.deepPurpleAccent)),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (_) => const MainScreen(),
          AppRoutes.EDITORA_PAGE: (_) => const EditoraScreen(),
          AppRoutes.EDITORA_FORM: (_) => const EditoraForm(),
        },
      ),
    );
  }
}

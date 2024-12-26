import 'package:drinking_game/controller/game_controller.dart';
import 'package:drinking_game/telas/create_user/create_user_screen.dart';
import 'package:drinking_game/telas/list_users/list_users.dart';
import 'package:drinking_game/telas/selection/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GameController())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // return const SelectionScreen();
    return ListUsers();
  }
}

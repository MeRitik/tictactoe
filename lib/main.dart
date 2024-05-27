import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/modal/game_modal.dart';
import 'package:tictac/pages/home_page.dart';
import 'package:tictac/pages/mode_page.dart';
import 'package:tictac/pages/tic_tac.dart';
import 'package:tictac/pages/vs_ai.dart';
import 'package:tictac/theme/light_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: lightTheme,
      routes: {
        '/home_page': (context) => const HomePage(),
        '/mode_page': (context) => const ModePage(),
        '/tic_tac': (context) => const TicTacToe(),
        '/vs_ai': (context) => const TicTacToeBot(),
      },
    );
  }
}

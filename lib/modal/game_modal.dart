import 'package:flutter/material.dart';

class GameModel with ChangeNotifier {
  String _initialPlayer = 'X';

  String get initialPlayer => _initialPlayer;

  void setInitialPlayer(String player) {
    _initialPlayer = player;
    notifyListeners();
  }
}

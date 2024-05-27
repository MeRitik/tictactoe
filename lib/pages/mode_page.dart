import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/modal/game_modal.dart';

class ModePage extends StatelessWidget {
  const ModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select player X / O',
          style: TextStyle(
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<GameModel>(context, listen: false)
                  .setInitialPlayer('X');
              Navigator.pushNamed(context, '/tic_tac');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text(
                    'X',
                    style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<GameModel>(context, listen: false)
                        .setInitialPlayer('O');
                    Navigator.pushNamed(context, '/tic_tac');
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text(
                      'O',
                      style: TextStyle(
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

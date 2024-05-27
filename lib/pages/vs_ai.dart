import 'package:flutter/material.dart';
import 'dart:math';

class TicTacToeBot extends StatefulWidget {
  const TicTacToeBot({super.key});

  @override
  State<TicTacToeBot> createState() => _TicTacToeBotState();
}

class _TicTacToeBotState extends State<TicTacToeBot> {
  List<String> board = [];
  bool xMoves = true;
  String winner = '';

  @override
  void initState() {
    super.initState();
    _resetBoard();
  }

  String _checkWinner() {
    const List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pat in winPatterns) {
      if (board[pat[0]] == board[pat[1]] &&
          board[pat[1]] == board[pat[2]] &&
          board[pat[0]] != '') {
        return board[pat[0]];
      }
    }

    return '';
  }

  void _makeMove(int index) {
    setState(() {
      if (winner == '' && board[index] == '') {
        board[index] = xMoves ? 'X' : 'O';
        xMoves = !xMoves;
        winner = _checkWinner();
        if (winner == '' && !xMoves) {
          _makeBotMove();
        }
      }
    });
  }

  void _makeBotMove() {
    int bestMove = _findBestMove();
    if (bestMove != -1) {
      setState(() {
        board[bestMove] = 'O';
        xMoves = !xMoves;
        winner = _checkWinner();
      });
    }
  }

  int _findBestMove() {
    int bestVal = -1000;
    int bestMove = -1;
    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') {
        board[i] = 'O';
        int moveVal = _minimax(0, false);
        board[i] = '';
        if (moveVal > bestVal) {
          bestMove = i;
          bestVal = moveVal;
        }
      }
    }
    return bestMove;
  }

  int _minimax(int depth, bool isMax) {
    String result = _checkWinner();
    if (result == 'O') return 10 - depth;
    if (result == 'X') return depth - 10;
    if (board.every((element) => element.isNotEmpty)) return 0;

    if (isMax) {
      int best = -1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          best = max(best, _minimax(depth + 1, !isMax));
          board[i] = '';
        }
      }
      return best;
    } else {
      int best = 1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          best = min(best, _minimax(depth + 1, !isMax));
          board[i] = '';
        }
      }
      return best;
    }
  }

  void _resetBoard() {
    setState(() {
      board = List<String>.filled(9, '');
      xMoves = true;
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe vs Bot"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _makeMove(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          board[index],
                          style: TextStyle(
                            color: board[index] == 'X'
                                ? Colors.green.shade200
                                : Colors.red.shade200,
                            fontSize: 72,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  winner.isNotEmpty ? 'Winner: $winner' : '',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.lightGreen,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.restore_outlined,
              size: 18,
              color: Colors.greenAccent.shade700,
            ),
            label: Text(
              'Reset Board',
              style: TextStyle(
                color: Colors.greenAccent.shade700,
              ),
            ),
            onPressed: _resetBoard,
          ),
        ],
      ),
    );
  }
}

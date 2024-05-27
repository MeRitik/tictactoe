import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tictac/modal/game_modal.dart';

class ModePage extends StatefulWidget {
  const ModePage({super.key});

  @override
  ModePageState createState() => ModePageState(); // Public class
}

class ModePageState extends State<ModePage> {
  int currPlayerIndex = 0;
  List<String> players = ['X', 'O'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7E42F5),
              Color(0xFFB09AF6),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choose a side',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Column(
                  children: List.generate(players.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currPlayerIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          width: 250,
                          height: 200,
                          decoration: BoxDecoration(
                            color: currPlayerIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: currPlayerIndex == index
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              players[index],
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 160,
                                  color: currPlayerIndex == index
                                      ? const Color(0xFF7E42F5)
                                      : Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),
                Transform(
                  transform: Matrix4.skewX(-0.2),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<GameModel>(context, listen: false)
                            .setInitialPlayer(players[currPlayerIndex]);
                        Navigator.pushNamed(context, '/tic_tac');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            side: const BorderSide(
                              color: Color(0xFF7E42F5),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Start Game'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

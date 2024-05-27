import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.skewX(-0.1),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mode_page');
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Play VS Friend'),
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      LinearBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Transform(
              transform: Matrix4.skewX(-0.1),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/vs_ai');
                  },
                  icon: const Icon(Icons.android),
                  label: const Text('Play VS Bot'),
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      LinearBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

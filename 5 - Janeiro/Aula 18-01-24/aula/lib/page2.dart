import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnimatedText(),
                const SizedBox(height: 10),
                _buildAnimatedPersonIcon(),
                const SizedBox(height: 10),
                _buildAnimatedTextDescription(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedText() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0.0, -200.0 + 200.0 * value),
            child: child,
          ),
        );
      },
      child: const Text(
        'Gabriel Moraes',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildAnimatedPersonIcon() {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(-200.0 + 200.0 * value, 0.0),
            child: child,
          ),
        );
      },
      child: const Icon(
        Icons.person,
        size: 100,
        color: Colors.white,
      ),
    );
  }

  Widget _buildAnimatedTextDescription() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0.0, 200.0 - 200.0 * value),
            child: child,
          ),
        );
      },
      child: const Text(
        '''Sou um desenvolvedor
apaixonado por inovação,
especializado em criar aplicativos
intuitivos e eficientes.''',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.linearToEaseOut,
      reverseCurve: Curves.easeInToLinear,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation 3')),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        backgroundColor: Colors.deepPurple[100],
        child: Icon(Icons.back_hand, color: Colors.deepPurple[900]),
        onPressed: () {
          if (_animationController.isAnimating) {
            _animationController.stop();
          } else {
            _animationController.repeat(reverse: true);
          }
        },
      ),
      body: AlignTransition(
        alignment: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(backgroundColor: Colors.orange),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tema/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Tema'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: _screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //stops: [0.5, 0.5],
                tileMode: TileMode.clamp,
                colors: [
                  kPageFirstColor,
                  kPageSecondColor,
                  kPageSecondColor,
                  kPageSecondColor,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

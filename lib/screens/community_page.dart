import 'package:flutter/material.dart';

import '../const.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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

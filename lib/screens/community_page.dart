import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tema/screens/community_pages/page1.dart';

import '../const.dart';
import 'dart:ui' as ui;

import 'community_pages/page2.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  'Комьюнити',
                  style: TextStyle(),
                ),
                const Icon(
                  Icons.expand_more,
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/Send.svg',
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}

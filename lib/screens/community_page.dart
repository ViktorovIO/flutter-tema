import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tema/components/community_person.dart';

import '../const.dart';
import 'dart:ui' as ui;

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
              children: const [
                Text(
                  'Комьюнити',
                  style: TextStyle(),
                ),
                Icon(
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
        //scrollDirection: Axis.vertical,
        children: const [
          CommunityPerson(
            imagePath: 'assets/images/girl1.jpg',
            name: 'Катя',
            age: 21,
            about:
                'Учусь на филологии, увлекаюсь социальными науками. Хочу прокачаться в психологии, ищу единомышленников.',
          ),
          CommunityPerson(
            imagePath: 'assets/images/girl2.jpg',
            name: 'Марина',
            age: 26,
            about: 'Люблю белые платья и гулять по утрам',
          ),
        ],
      ),
    );
  }
}

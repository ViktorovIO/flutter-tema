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
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  'Community',
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
            imagePath: 'assets/images/community/mason.jpg',
            name: 'Mason',
            age: 19,
            about:
                'I am for a person with whom we will watch a lecture on how the future will look like..',
          ),
          CommunityPerson(
            imagePath: 'assets/images/community/noah.jpg',
            name: 'Noah',
            age: 21,
            about: '♌️,model',
          ),
          CommunityPerson(
            imagePath: 'assets/images/community/meaghan.jpg',
            name: 'Meaghan',
            age: 19,
            about: 'Creative director of Oral b. Brush your teeth before our date 😂',
          ),
          CommunityPerson(
            imagePath: 'assets/images/community/kate.jpg',
            name: 'Kate',
            age: 20,
            about: 'I dream of a date at the Eiffel Tower 🫶🏻',
          ),
          CommunityPerson(
            imagePath: 'assets/images/community/liam.jpg',
            name: 'Liam',
            age: 18,
            about: 'Tattoo master, instead of wedding rings, I will fill us with tattoos on our fingers 💓',
          ),
        ],
      ),
    );
  }
}

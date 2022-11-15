import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const.dart';
import 'dart:ui' as ui;

class CommunityPerson extends StatefulWidget {
  final String imagePath;
  final String name;
  final int age;
  final String about;
  const CommunityPerson(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.age,
      required this.about});

  @override
  State<CommunityPerson> createState() => _CommunityPersonState();
}

class _CommunityPersonState extends State<CommunityPerson> {
  bool isLikePressed = false;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: _screenHeight,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 16,
          child: ClipRRect(
            borderRadius: kBorderRadiusCircularDefault,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                width: _screenWidth - 16 - 16,
                //height: 100,

                decoration: BoxDecoration(
                  borderRadius: kBorderRadiusCircularDefault,
                  color: Colors.black.withOpacity(0.4),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 32.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.name}, ${widget.age}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: kTextMainColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isLikePressed = !isLikePressed;
                              });
                            },
                            icon: isLikePressed
                                ? SvgPicture.asset(
                                    'assets/icons/Favorite_fill.svg')
                                : SvgPicture.asset('assets/icons/Favorite.svg'),
                          ),
                          //SvgPicture.asset('assets/icons/Favorite.svg'),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        widget.about,
                        style: const TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.w500,
                          color: kTextMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

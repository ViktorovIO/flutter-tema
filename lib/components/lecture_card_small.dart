import 'package:flutter/material.dart';

import '../const.dart';
import 'dart:ui' as ui;

class LectureCardSmall extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String lector;
  final Color lectureColor;
  final int likesCount;

  const LectureCardSmall({
    required this.likesCount,
    this.lectureColor = Colors.white,
    required this.lector,
    required this.description,
    required this.imagePath,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: kBorderRadiusCircularDefault,
            child: Stack(
              children: [
                Image.asset(
                  //'assets/images/dud.jpg',
                  imagePath,
                  width: kLectureCardWidth,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                //*lector name
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: ClipRRect(
                    borderRadius: kBorderRadiusCircularDefault,
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: kBorderRadiusCircularDefault,
                        ),
                        child: Text(
                          lector,
                          style: TextStyle(
                            color: kTextMainColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //* likes
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: ClipRRect(
                    borderRadius: kBorderRadiusCircularDefault,
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: kBorderRadiusCircularDefault,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star_outline,
                              color: kTextMainColor,
                              size: 18,
                            ),
                            Text(
                              '$likesCount',
                              style: TextStyle(
                                color: lectureColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          //* title
          Container(
            width: kLectureCardWidth,
            height: 60,
            child: Text(
              //'Как менялась профессия журналиста за последние 20 лет',
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: kTextMainColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          //const SizedBox(height: 16.0),
          // Flexible(
          //   child: Container(
          //     width: kLectureCardWidth,
          //     child: Text(
          //       //'О личном росте, карьере на Sports.ru и цензуре в социальных сетях',
          //       description,
          //       maxLines: 2,
          //       overflow: TextOverflow.ellipsis,
          //       style: const TextStyle(
          //         height: 1.5,
          //         color: Color.fromARGB(255, 134, 124, 143),
          //         fontSize: 13,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

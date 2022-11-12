import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const.dart';
import 'dart:ui' as ui;

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: _screenHeight,
          child: Image.asset(
            'assets/images/girl2.jpg',
            fit: BoxFit.fitHeight,
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
                            'Марина, 26',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: kTextMainColor,
                            ),
                          ),
                          SvgPicture.asset('assets/icons/Favorite.svg'),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Смотрю кино, кушаю рыбу, хочу на море.',
                        style: TextStyle(
                          fontSize: 13,
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

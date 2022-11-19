import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const.dart';
import 'dart:ui' as ui;

class LectureBig extends StatelessWidget {
  const LectureBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          width: double.infinity,
          height: 209,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: kBorderRadiusCircularDefault,
                child: Image.asset(
                  'assets/images/trabun.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              //*lector name
              Positioned(
                bottom: 8,
                left: 8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //*name
                    ClipRRect(
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
                            'Дани Трабун',
                            style: TextStyle(
                              color: kTextMainColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8.0),

                    //*Autor
                    ClipRRect(
                      borderRadius: kBorderRadiusCircularDefault,
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.black.withOpacity(0.3),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff044286).withOpacity(0.7),
                                Color.fromARGB(255, 96, 4, 90).withOpacity(0.7),
                              ],
                            ),
                            borderRadius: kBorderRadiusCircularDefault,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset('assets/icons/Diamond.svg'),
                              const SizedBox(width: 3.0),
                              Text(
                                'Авторский курс',
                                style: TextStyle(
                                  color: kTextMainColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            '34',
                            style: TextStyle(
                              color: kTextMainColor,
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
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            //top: 16.0,
          ),
          child: Text(
            'Метавселенная: новый вектор коммуникации и нетворкинга',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: kTextMainColor,
            ),
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}

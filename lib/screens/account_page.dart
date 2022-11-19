import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeightDiv2 = screenHeight / 2;

    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPageFirstColor,
              kPageFirstColor,
              Color(0xff370252),
              Color(0xff370252),
              Color(0xff370252),
              Color(0xff370252),

              // kPageSecondColor,
              // kPageSecondColor,
              // kPageSecondColor,
              // kPageSecondColor,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPageFirstColor,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'artemy',
                      style: TextStyle(
                        color: kTextMainColor,
                      ),
                    ),
                    // const Icon(
                    //   Icons.expand_more,
                    //   color: kTextMainColor,
                    // ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/User.svg'),
                    const SizedBox(width: 4.0),
                    const Text(
                      '1.2млн',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                // SvgPicture.asset(
                //   'assets/icons/Send.svg',
                //   color: kTextMainColor,
                // ),
              ],
            ),
          ),
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              //* image (character)
              Positioned(
                top: 50,
                child: Container(
                  // width: double.infinity,
                  // height: screenHeight,
                  child: Image.asset(
                    'assets/images/artem.png',
                    //colorBlendMode: BlendMode.difference,
                  ),
                ),
              ),

              //* spheres
              const AccountSphere(
                top: 120,
                left: 32,
                isSelected: true,
              ),
              const AccountSphere(
                top: 300,
                left: 16,
              ),
              const AccountSphere(
                top: 130,
                right: 32,
              ),
              const AccountSphere(
                top: 350,
                right: 16,
              ),

              //* title and decription
              Positioned(
                bottom: 100,
                right: 16,
                child: ClipRRect(
                  borderRadius: kBorderRadiusCircularDefault,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: screenWidth - 16 - 16,
                      //height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: kBorderRadiusCircularDefault,
                      ),
                      child: Column(
                        children: [
                          //* name and star icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Артемий, 20',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SvgPicture.asset('assets/icons/friends_star.svg'),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Предприниматель, маркетолог, создатель приложения Тема. Постоянно в поиске нового!',
                            style: TextStyle(
                              color: Colors.white,
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
      ),
    );
  }
}

class AccountSphere extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final bool isSelected;
  const AccountSphere({
    Key? key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected
                  ? const Color.fromARGB(255, 223, 117, 230).withOpacity(0.5)
                  : Colors.transparent,
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 71, 130, 194),
                    Color.fromARGB(255, 114, 30, 103),
                  ],
                ),
                shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}

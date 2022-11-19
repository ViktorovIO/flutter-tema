import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
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
                      'Лента друзей',
                      style: TextStyle(
                        color: kTextMainColor,
                      ),
                    ),
                    const Icon(
                      Icons.expand_more,
                      color: kTextMainColor,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/icons/Send.svg',
                  color: kTextMainColor,
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const FriendPost(
                    index: 1,
                    imageUrl: 'assets/images/char1.png',
                    title:
                        'Что-то грандиозное случилось сегодня! Если бы вы знали как долго я искала',
                    heartsCount: '16k',
                    starsCount: '10k',
                    sendsCount: '3k',
                  ),
                  const FriendPost(
                    index: 2,
                    imageUrl: 'assets/images/char2.png',
                    title:
                        'Хочу поделиться с потрясающей новостью! Сегодня исполнилось ровно год с тех пор как моя жизнь круто изменилась!',
                    heartsCount: '1k',
                    starsCount: '800',
                    sendsCount: '127',
                  ),
                  const FriendPost(
                    index: 3,
                    imageUrl: 'assets/images/char1.png',
                    title:
                        'Friends are the most priceless gifts that the universe can ever offer to us!',
                    heartsCount: '2k',
                    starsCount: '456',
                    sendsCount: '134',
                  ),
                  const FriendPost(
                    index: 4,
                    imageUrl: 'assets/images/char2.png',
                    title:
                        'Make such beautiful moments by merely sending your friends funny texts messages that will surely make them laugh their problems away!',
                    heartsCount: '1k',
                    starsCount: '556',
                    sendsCount: '112',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FriendPost extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String heartsCount;
  final String starsCount;
  final String sendsCount;
  final int index;
  const FriendPost({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.heartsCount,
    required this.starsCount,
    required this.sendsCount,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEven = false;
    index.isEven ? isEven = true : isEven = false;

    return SizedBox(
      width: double.infinity,
      height: 266,
      //color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: isEven ? null : 0,
            right: isEven ? 0 : null,
            child: Image.asset(imageUrl),
          ),
          Positioned(
            top: 50,
            right: isEven ? null : 16,
            left: isEven ? 16 : null,
            child: ClipRRect(
              borderRadius: kBorderRadiusCircularDefault,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadiusCircularDefault,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //*hearts
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/friends_heart.svg'),
                              Text(
                                heartsCount,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          //*stars
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/icons/friends_star.svg'),
                              Text(
                                starsCount,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          //*sends
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/icons/friends_send.svg'),
                              Text(
                                sendsCount,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tema/const.dart';
import 'dart:ui' as ui;

import '../components/lecture_card_big.dart';
import '../components/lecture_card_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;
    //final _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kPageFirstColor,
            kPageFirstColor,
            kPageSecondColor,
            kPageSecondColor,
            kPageSecondColor,
            kPageSecondColor,
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
                    'Tema',
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
        body: SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: safePadding + 60,
              ),

              const TitleBlock(text: 'В тренде'),

              //* Trends
              SizedBox(
                height: 210,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    //*lecture
                    const LectureCardSmall(
                      lector: 'Юрий Дудь',
                      likesCount: 17,
                      description:
                          'О личном росте, карьере на Sports.ru и цензуре в социальных сетях',
                      imagePath: 'assets/images/dud.jpg',
                      title:
                          'Как менялась профессия журналиста за последние 20 лет',
                    ),
                    const LectureCardSmall(
                      lector: 'Ася Казанцева',
                      likesCount: 45,
                      //lectureColor: Colors.black,
                      description:
                          'Решение задач социального взаимодействия - одна из самых уважительных причин для того, чтобы развивать мозг',
                      imagePath: 'assets/images/kazanceva.jpg',
                      title: 'Друзья как залог эволюционного успеха',
                    ),
                    const LectureCardSmall(
                      lector: 'Владимир Сурдин',
                      likesCount: 34,
                      //lectureColor: Colors.black,
                      description:
                          'Сколько планет в Солнечной системе? Этот вопрос способен серьёзно озадачить любого тридцатилетнего человека',
                      imagePath: 'assets/images/surdin.jpg',
                      title: 'Заблуждения и мифы о Вселенной',
                    ),
                    const SizedBox(width: 16.0),
                  ],
                ),
              ),

              const SizedBox(height: 16.0),

              const TitleBlock(text: 'Recommended'),

              const LectureBig(
                imagePath: 'assets/images/main/DwaneJohnson.jpg',
                title: 'Author\'s cource',
                description: 'The famous actor talks about depression and his experience…',
                lector: 'Dwayne Johnson',
              ),
              const LectureBig(
                imagePath: 'assets/images/main/ElonMusk.jpg',
                title: 'Author\'s cource',
                description: 'Elon Musk envisions the future for the world.',
                lector: 'Elon Musk',
              ),
              const LectureBig(
                imagePath: 'assets/images/main/RobertDowneyJr.jpg',
                title: 'Author\'s cource',
                description: 'Talks about living a very public life',
                lector: 'Robert Downey Jr.',
              ),

              //*bottom navigation height
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleBlock extends StatelessWidget {
  final String text;
  const TitleBlock({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: kTextMainColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

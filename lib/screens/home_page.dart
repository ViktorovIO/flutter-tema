import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tema/const.dart';

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
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          title: const Text('Tema'),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: safePadding + 80,
            ),

            //*lectures
            Container(
              height: 250,
              child: ListView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  //*lecture
                  LectureCard(
                    lector: 'Юрий Дудь',
                    likesCount: 17,
                    description:
                        'О личном росте, карьере на Sports.ru и цензуре в социальных сетях',
                    imagePath: 'assets/images/dud.jpg',
                    title:
                        'Как менялась профессия журналиста за последние 20 лет',
                  ),
                  LectureCard(
                    lector: 'Ася Казанцева',
                    likesCount: 45,
                    //lectureColor: Colors.black,
                    description:
                        'Решение задач социального взаимодействия - одна из самых уважительных причин для того, чтобы развивать мозг',
                    imagePath: 'assets/images/kazanceva.jpg',
                    title: 'Друзья как залог эволюционного успеха',
                  ),
                  LectureCard(
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
          ],
        )),
      ),
    );
  }
}

class LectureCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String lector;
  final Color lectureColor;
  final int likesCount;

  const LectureCard({
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Icon(Icons.person_outline),
                      Text(
                        lector,
                        style: TextStyle(
                          color: lectureColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                //* likes
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
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
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Flexible(
            child: Container(
              width: kLectureCardWidth,
              child: Text(
                //'О личном росте, карьере на Sports.ru и цензуре в социальных сетях',
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1.5,
                  color: Color.fromARGB(255, 134, 124, 143),
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

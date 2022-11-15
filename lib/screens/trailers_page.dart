import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tema/components/trailer.dart';

class TrailersPage extends StatefulWidget {
  const TrailersPage({super.key});

  @override
  State<TrailersPage> createState() => _TrailersPageState();
}

class _TrailersPageState extends State<TrailersPage> {
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
                  'Трейлеры',
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
        scrollDirection: Axis.vertical,
        children: const [
          Trailer(
            trailerPath: 'assets/trailers/kazanceva.mp4',
            name: 'Ася Казанцева',
            title: 'Почему мы видим мир по-разному?',
            decription:
                'Как мозг обманывает нас и заставляет совершать действия, которые на первый взгляд кажутся логичными?',
          ),
          Trailer(
            trailerPath: 'assets/trailers/surdin.mp4',
            name: 'Владимир Сурдин',
            title: 'Загадочные сигналы из космоса: это инопланетяне?',
            decription:
                'В каких частях Вселенной перспективнее всего искать «братьев по разуму»? Какими экстравагантными проектами ученые пытаются привлечь внимание инопланетян?',
          ),
        ],
      ),
    );
  }
}

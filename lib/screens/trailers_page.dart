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
            trailerPath: 'assets/trailers/IMG_5231.mp4',
            tagName: 'Психология',
            name: 'Лина Дианова',
            title: 'О пассивной агрессии',
            decription: 'Откуда появляется пассивная агрессия',
          ),
          Trailer(
            trailerPath: 'assets/trailers/IMG_5239.mp4',
            name: 'Николай Жаринов',
            tagName: 'Искусство',
            title: 'Микеланджело был несчастен?',
            decription: 'О жизни и творчестве величайшего скульптора',
          ),
          Trailer(
            trailerPath: 'assets/trailers/IMG_5241.mp4',
            name: 'Дмитрий Алексеев',
            tagName: 'Бизнес',
            title: 'Создатель DNS о первых деньгах',
            decription:
                'Миллиардер Дмитрий Алексеев о том, как создал компанию DNS',
          ),
        ],
      ),
    );
  }
}

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
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  'Trailers',
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
            trailerPath: 'assets/trailers/musk.mp4',
            tagName: 'Business',
            name: 'Elon Musk',
            title: '«What the future will look like?»',
            decription: 'Elon Musk envisions the future for the world.',
          ),
          Trailer(
            trailerPath: 'assets/trailers/zuckerberg.mp4',
            name: 'Mark Zuckerberg',
            tagName: 'Business',
            title: '«Identify in Metaverse»',
            decription: 'Mark Zuckerberg is CEO of Meta, formerly Facebook…',
          ),
          Trailer(
            trailerPath: 'assets/trailers/gopnik.mp4',
            name: 'Alison Gopnik',
            tagName: 'Psychology',
            title: '«What goes on in a child\'s head?»',
            decription:
                '“Babies and young children are an institution for human exploration and development,” says psychologist Alison Gopnik…',
          ),
        ],
      ),
    );
  }
}

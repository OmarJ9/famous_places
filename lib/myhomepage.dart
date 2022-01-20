import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_ui/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  final _style = GoogleFonts.nunito(
      fontSize: 23,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      textBaseline: TextBaseline.alphabetic);
  bool ishorizantal = false;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        scrollDirection: (ishorizantal) ? Axis.horizontal : Axis.vertical,
        children: [
          _buildpage(
              page: '1',
              image: imagesurl[0],
              title: titles[0],
              description: description[0]),
          _buildpage(
              page: '2',
              image: imagesurl[1],
              title: titles[1],
              description: description[1]),
          _buildpage(
              page: '3',
              image: imagesurl[2],
              title: titles[2],
              description: description[2]),
          _buildpage(
              page: '4',
              image: imagesurl[3],
              title: titles[3],
              description: description[3]),
          _buildpage(
              page: '5',
              image: imagesurl[4],
              title: titles[4],
              description: description[4]),
          _buildpage(
              page: '6',
              image: imagesurl[5],
              title: titles[5],
              description: description[5]),
          _buildpage(
              page: '7',
              image: imagesurl[6],
              title: titles[6],
              description: description[6]),
          _buildpage(
              page: '8',
              image: imagesurl[7],
              title: titles[7],
              description: description[7]),
        ],
      ),
    );
  }

  Widget _buildpage({required String image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(
                .9,
              ),
              Colors.black.withOpacity(
                .2,
              )
            ],
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        ishorizantal = !ishorizantal;
                      });
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        (ishorizantal)
                            ? Icons.align_horizontal_left
                            : Icons.vertical_align_center,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    page,
                    style: _style,
                  ),
                  Text(
                    '/8',
                    style: _style.copyWith(
                        fontSize: 13, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                height: 240,
              ),
              FadeInUp(
                duration: const Duration(seconds: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: _style.copyWith(fontSize: 33),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildrating(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      description,
                      style: _style.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildrating() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Colors.grey,
          size: 16,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          '4.0',
          style: _style.copyWith(fontSize: 10, color: Colors.white60),
        ),
        Text(
          ' (2000) ',
          style: _style.copyWith(fontSize: 7, color: Colors.white60),
        ),
      ],
    );
  }
}

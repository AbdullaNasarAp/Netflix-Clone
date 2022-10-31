import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/constant.dart';
import 'package:netflix_clone/domain/core/color.dart';
import 'package:netflix_clone/presentation/widget/app_bar_widget.dart';

class DownloadPage extends StatelessWidget {
  DownloadPage({Key? key}) : super(key: key);

  final widgets = [
    const _SmartDownload(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(title: "Downloads"),
            ),
            body: ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return widgets[index];
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 25,
                  );
                },
                itemCount: widgets.length)));
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  final List imageList = [
    "https://storage.googleapis.com/stateless-campfire-pictures/2019/02/Netfli-You-Key-Art-Movie-Poster.jpg",
    "https://m.media-amazon.com/images/M/MV5BN2IyYzI4YmQtNzBmMi00Mjg3LWI4NTMtNmZjNjk3YjIwZmJhXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMTcyNzk5NDg1Nl5BMl5BanBnXkFtZTgwNTM5MDQxNDM@._V1_.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: iconColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const VerticleSpace(height: 10),
        const Text(
          "We will download personalised selection of \n movies and show for you, so there's\n   always something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        const VerticleSpace(height: 10),
        Container(
          width: size.width,
          height: size.width,
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white24,
                radius: size.width * 0.35,
              ),
              DownloadImg(
                imageList: imageList[0],
                margin: const EdgeInsets.only(
                  left: 110,
                ),
                angle: 20,
                size: Size(size.width * 0.4, size.width * 0.68),
              ),
              DownloadImg(
                imageList: imageList[2],
                margin: const EdgeInsets.only(
                  right: 110,
                ),
                angle: -20,
                size: Size(size.width * 0.4, size.width * 0.68),
              ),
              DownloadImg(
                radius: 10,
                size: Size(size.width * 0.45, size.width * 0.68),
                imageList: imageList[1],
                margin: const EdgeInsets.only(bottom: 10),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const [
          Icon(
            Icons.settings,
            color: iconColor,
          ),
          HorizontalSpace(width: 10),
          Text(
            "Smart Download",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: buttonColorBlue,
            onPressed: () {},
            child: const Text(
              "Set up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        VerticleSpace(height: 10),
        MaterialButton(
          color: buttonColorWhite,
          onPressed: () {},
          child: const Text(
            "See what you can download",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class DownloadImg extends StatelessWidget {
  const DownloadImg({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          margin: margin,
          width: size.width,
          height: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

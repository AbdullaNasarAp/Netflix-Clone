import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:netflix_clone/domain/core/color.dart';

class Imagedart extends StatelessWidget {
  const Imagedart({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: image,
      height: size.height * 0.25,
      width: size.width * 0.25,
    );
  }
}

class TextWidg extends StatelessWidget {
  const TextWidg({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: iconColor),
      maxLines: 1,
    );
  }
}

class TextBOld extends StatelessWidget {
  const TextBOld({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: iconColor, fontSize: 22, fontWeight: FontWeight.bold),
      maxLines: 1,
    );
  }
}

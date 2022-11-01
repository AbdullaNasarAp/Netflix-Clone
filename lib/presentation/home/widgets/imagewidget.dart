import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../api_model/movie_model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.movie1,
    required this.url,
    required this.index,
  }) : super(key: key);

  final List<Results>? movie1;
  final String url;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: 260,
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: url,
                  width: 160,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 12,
          bottom: -20,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: Colors.white,
            child: Text(
              index,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 150,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.yellow),
            ),
          ),
        )
      ],
    );
  }
}

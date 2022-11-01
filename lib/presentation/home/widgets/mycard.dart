import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/api_services/const_api.dart';

import '../../../api_model/movie_model.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    this.movie1,
    this.movie,
    this.movie2,
  }) : super(key: key);

  final List<Results>? movie;
  final List<Results>? movie1;
  final List<Results>? movie2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: List.generate(movie1?.length ?? 0, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.BASE_IMAGE_URL}${movie1![index].backdropPath}',
                  width: 110,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

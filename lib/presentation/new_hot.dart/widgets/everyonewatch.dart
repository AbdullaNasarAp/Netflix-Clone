import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/api_services/api_client.dart';
import 'package:netflix_clone/api_services/api_service.dart';
import 'package:netflix_clone/domain/constant.dart';

import '../../../api_model/movie_model.dart';
import '../../../api_services/const_api.dart';
import '../../../domain/core/color.dart';

class EveryoneWatching extends StatefulWidget {
  const EveryoneWatching({Key? key}) : super(key: key);

  @override
  State<EveryoneWatching> createState() => _EveryoneWatchingState();
}

class _EveryoneWatchingState extends State<EveryoneWatching> {
  List<Results>? movie3;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    movie3 =
        await MovieRemoteDataSourceImpl(ApiClient(Client())).getComingSoon();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : RefreshIndicator(
            onRefresh: () {
              return Future<void>.delayed(const Duration(seconds: 3));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(movie3?.length ?? 0, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 220,
                      child: Everyimg(
                          movie3: movie3,
                          imgstring:
                              '${ApiConstants.BASE_IMAGE_URL}${movie3![index].backdropPath}'),
                    ),
                    movie3![index].adult
                        ? Row(
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 2.5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                Colors.grey.withOpacity(0.7)),
                                      ),
                                      Container(
                                        width: size.width * 0.34,
                                        height: 2.5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.red.withOpacity(0.8)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.near_me,
                                color: iconColor,
                                size: 30,
                              ),
                              VerticleSpace(
                                height: 5,
                              ),
                              HorizontalSpace(
                                width: 30,
                              ),
                              Icon(
                                Icons.info_outline,
                                color: iconColor,
                                size: 30,
                              ),
                              HorizontalSpace(width: 10),
                              Icon(
                                Icons.add,
                                color: iconColor,
                                size: 30,
                              ),
                              VerticleSpace(
                                height: 5,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        movie3![index].releaseDate,
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        movie3![index].title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        movie3![index].overview,
                        style: TextStyle(
                            height: 1.4, color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    const VerticleSpace(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        movie3![index].mediaType.toString(),
                        style: TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
  }
}

class Everyimg extends StatelessWidget {
  const Everyimg({
    Key? key,
    required this.movie3,
    required this.imgstring,
  }) : super(key: key);
  final String imgstring;

  final List<Results>? movie3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: imgstring,
          ),
        ),
        Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2))),
        const Positioned(
          left: 165,
          bottom: 90,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 50,
          ),
        ),
        const Positioned(
          left: 330,
          bottom: 20,
          child: Icon(
            Icons.volume_off,
            color: iconColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}

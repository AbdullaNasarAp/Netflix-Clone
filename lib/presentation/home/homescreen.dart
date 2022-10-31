import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/api_model/movie_model.dart';
import 'package:netflix_clone/api_services/api_client.dart';
import 'package:netflix_clone/api_services/api_service.dart';
import 'package:netflix_clone/api_services/const_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Results>? movie;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    movie = await MovieRemoteDataSourceImpl(ApiClient(Client())).getPopular();
    setState(() {
      isLoading = false;
    });
    print(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 3,
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (BuildContext context, index) {
            return GridTile(
                child: Stack(
              children: [
                Column(
                  children: [
                    Text(movie![index].releaseDate),
                    Text(movie![index].popularity.toString()),
                    CachedNetworkImage(
                        imageUrl:
                            '${ApiConstants.BASE_IMAGE_URL}${movie![index].backdropPath}')
                  ],
                )
              ],
            ));
          },
          physics: ScrollPhysics(),
          itemCount: movie?.length ?? 0,
        )
      ],
    ));
  }
}

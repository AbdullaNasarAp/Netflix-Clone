import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/domain/constant.dart';
import 'package:netflix_clone/domain/core/color.dart';
import 'package:netflix_clone/presentation/home/widgets/imagewidget.dart';
import 'package:netflix_clone/presentation/home/widgets/mycard.dart';

import '../../api_model/movie_model.dart';
import '../../api_services/api_client.dart';
import '../../api_services/api_service.dart';
import '../../api_services/const_api.dart';
import 'widgets/firstsection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Results>? movie;
  List<Results>? movie1;
  List<Results>? movie2;
  List<Results>? movie3;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    movie = await MovieRemoteDataSourceImpl(ApiClient(Client())).getTrending();
    movie1 = await MovieRemoteDataSourceImpl(ApiClient(Client())).getPopular();
    movie2 =
        await MovieRemoteDataSourceImpl(ApiClient(Client())).getPlayingNow();
    movie3 =
        await MovieRemoteDataSourceImpl(ApiClient(Client())).getComingSoon();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://raw.githubusercontent.com/sopheamen007/app.mobile.netflix-clone-app-ui/master/assets/images/banner.webp",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                          height: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.85),
                                Colors.black.withOpacity(0.0),
                              ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter))),
                      SizedBox(
                        height: 500,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://raw.githubusercontent.com/sopheamen007/app.mobile.netflix-clone-app-ui/master/assets/images/banner_2.webp",
                              width: 300,
                            ),
                            const VerticleSpace(
                              height: 15,
                            ),
                            const Text(
                              "Excting - Sci-Fi Drama - Sci-Fi Adventure",
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const VerticleSpace(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.add,
                            size: 25,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "My List",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 13, left: 8, top: 2, bottom: 2),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Play",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            size: 25,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Info",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  const VerticleSpace(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Hometext(tx: "My List"),
                      ),
                      const VerticleSpace(
                        height: 8,
                      ),
                      MyCard(movie1: movie1),
                      const VerticleSpace(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Hometext(tx: "Popular"),
                      ),
                      const VerticleSpace(
                        height: 8,
                      ),
                      MyCard(movie1: movie1),
                      const VerticleSpace(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Hometext(tx: "Trending Now"),
                      ),
                      const VerticleSpace(
                        height: 8,
                      ),
                      MyCard(movie1: movie1),
                      const VerticleSpace(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Hometext(tx: "NetFlix Original"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
///////////////////indexed widget/////////////////////////
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children:
                                  List.generate(movie2?.length ?? 0, (index) {
                                return ImageWidget(
                                  index: "${index + 1}",
                                  movie1: movie1,
                                  url:
                                      '${ApiConstants.BASE_IMAGE_URL}${movie![index].backdropPath}',
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
///////////////////indexed widget/////////////////////////
                      const VerticleSpace(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Hometext(tx: "Anime"),
                      ),
                      const VerticleSpace(
                        height: 8,
                      ),
                      MyCard(movie1: movie1)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              child: FirstSection(),
            ),
          ],
        ),
      ),
    );
  }
}

class Hometext extends StatelessWidget {
  const Hometext({
    Key? key,
    required this.tx,
  }) : super(key: key);
  final String tx;
  @override
  Widget build(BuildContext context) {
    return Text(
      tx,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class Textt extends StatelessWidget {
  const Textt({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }
}

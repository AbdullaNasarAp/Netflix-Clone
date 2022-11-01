import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/api_services/const_api.dart';
import 'package:netflix_clone/domain/constant.dart';
import 'package:netflix_clone/domain/core/color.dart';
import 'package:netflix_clone/presentation/new_hot.dart/widgets/everyonewatch.dart';
import 'package:netflix_clone/presentation/new_hot.dart/widgets/tabs.dart';

import '../../api_model/movie_model.dart';
import '../../api_services/api_client.dart';
import '../../api_services/api_service.dart';
import '../../domain/core/vars/vars.dart';

class NewAndHot extends StatefulWidget {
  @override
  _NewAndHotState createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  int currentPageIndex = 0;
  var movietype = NewHot.comingSoon;
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      title: Text(
        "New & Hot",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.cast,
              size: 28,
            ),
            onPressed: () {}),
        IconButton(
            icon: Image.network(
              "https://raw.githubusercontent.com/sopheamen007/app.mobile.netflix-clone-app-ui/master/assets/images/profile.jpeg",
              fit: BoxFit.cover,
              width: 26,
              height: 26,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                TabsWidget(
                  text: '🌽 Coming Soon',
                  color: Colors.white,
                  function: () {
                    if (movietype == NewHot.comingSoon) {
                      return;
                    }
                    setState(() {
                      movietype = NewHot.comingSoon;
                    });
                  },
                  fontSize: movietype == NewHot.comingSoon ? 16 : 12,
                ),
                const SizedBox(
                  width: 25,
                ),
                TabsWidget(
                  text: "👁️👁️ Everyone's Watching",
                  color: Colors.white,
                  function: () {
                    if (movietype == NewHot.everyoneWatching) {
                      return;
                    }
                    setState(() {
                      movietype = NewHot.everyoneWatching;
                    });
                  },
                  fontSize: movietype == NewHot.everyoneWatching ? 16 : 12,
                ),
              ],
            ),
            movietype == NewHot.everyoneWatching
                ? Container()
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.notifications_none_outlined,
                              size: 28,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            const HorizontalSpace(
                              width: 15,
                            ),
                            Text(
                              "Notifications",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.9)),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 22,
                          color: Colors.white.withOpacity(0.9),
                        )
                      ],
                    ),
                  ),
            const VerticleSpace(
              height: 20,
            ),
            movietype == NewHot.everyoneWatching
                ? Container(
                    child: EveryoneWatching(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(movie3?.length ?? 0, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : SizedBox(
                                  height: 220,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              ('${ApiConstants.BASE_IMAGE_URL}${movie3![index].backdropPath}'),
                                        ),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.2))),
                                    ],
                                  ),
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
                                                  color: Colors.grey
                                                      .withOpacity(0.7)),
                                            ),
                                            Container(
                                              width: size.width * 0.34,
                                              height: 2.5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.red
                                                      .withOpacity(0.8)),
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
                                  children: [
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.notifications_none_outlined,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Remind me",
                                          style: TextStyle(fontSize: 11),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.info_outline,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Info",
                                          style: TextStyle(fontSize: 11),
                                        )
                                      ],
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
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
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
                                  height: 1.4,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                          SizedBox(
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
                  )
          ],
        ),
      ),
    );
  }
}

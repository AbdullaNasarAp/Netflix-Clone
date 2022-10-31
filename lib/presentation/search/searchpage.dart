import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/api_services/const_api.dart';
import 'package:netflix_clone/domain/constant.dart';
import 'package:netflix_clone/domain/core/color.dart';
import 'package:netflix_clone/presentation/search/widgets/image.dart';

import '../../api_model/movie_model.dart';
import '../../api_services/api_client.dart';
import '../../api_services/api_service.dart';

ValueNotifier<List<Results>> temp = ValueNotifier([]);

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Results>? movie;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    movie = await MovieRemoteDataSourceImpl(ApiClient(Client())).getPopular();

    print(movie);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    fillColor: Colors.white24,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search)),
                onChanged: (String? value) {
                  if (value != null && value.isNotEmpty) {
                    temp.value.clear();
                    for (Results item in movie!) {
                      if (item.title
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        temp.value.add(item);
                      }
                    }
                  }
                  temp.notifyListeners();
                },
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticleSpace(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: TextBOld(title: "Top Searches"),
              ),
              const VerticleSpace(height: 15),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: temp,
                  builder: (BuildContext context, List<Results> movie,
                      Widget? child) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {},
                              leading: Imagedart(
                                image:
                                    '${ApiConstants.BASE_IMAGE_URL}${movie[index].backdropPath}',
                              ),
                              title: TextWidg(title: movie[index].title),
                              trailing: const Icon(
                                Icons.play_circle_outline_outlined,
                                color: iconColor,
                                size: 40,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: movie.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

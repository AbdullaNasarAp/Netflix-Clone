import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/homescreen.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottumnav.dart';

import '../downloads/downloads_page.dart';
import '../fast_laugh/fast_laughpage.dart';
import '../new_hot.dart/newandhot.dart';
import '../search/searchpage.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final pages = [
    const HomePage(),
    const NewAndHot(),
    const FastLaugh(),
    const SearchPage(),
    DownloadPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottumNav(),
    );
  }
}

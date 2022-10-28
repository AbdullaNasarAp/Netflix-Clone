import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottumNav extends StatelessWidget {
  const BottumNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'New&Hot',
              icon: Icon(
                Icons.collections,
              ),
            ),
            BottomNavigationBarItem(
              label: "Fast Laugh",
              icon: Icon(
                Icons.emoji_emotions,
              ),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              label: "Download",
              icon: Icon(
                Icons.download,
              ),
            ),
          ],
        );
      },
    );
  }
}

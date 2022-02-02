import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_work/pages/create_page.dart';
import 'package:for_work/pages/history_page.dart';
import 'package:for_work/pages/home_page.dart';
import 'package:for_work/pages/profile_page.dart';
import 'package:for_work/pages/save_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const  String id = "main_page";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentTap = 0;
  final _pages = [
  const HomePage(),
  const HistoryPage(),
  const CreatePage(),
  const SavePage(),
  const ProfilePage(),
  ];
  GlobalKey? _key;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: _pages[currentTap],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(20, 20, 22, 1),
        onTap: (int index){
          setState(() {
            currentTap = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTap,
        selectedItemColor: Colors.white,
        unselectedItemColor: const  Color.fromRGBO(166, 166, 166, 1),
        items:   [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Document.svg"),
            label: "Contracts",
          ),
         const  BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined, color: Color.fromRGBO(166, 166, 166, 1),),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Plus.svg"),
            label: "New",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Bookmark.svg"),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Profile.svg"),
             label: "Profile",
          )
        ],
      ),
    );
  }
}

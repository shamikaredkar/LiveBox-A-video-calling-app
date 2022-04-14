import 'package:flutter/material.dart';
import 'package:videocalling_finalproject/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Meet & Chat"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        onTap: onPageChanged,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank),
            label: "Meet & Chat"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock),
              label: "Meetings"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),
              label: "Contacts"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),
              label: "Settings"
          ),
        ],
      ),
    );
  }
}

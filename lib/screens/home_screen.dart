import 'package:flutter/material.dart';
import 'package:videocalling_finalproject/utils/colors.dart';
import 'package:videocalling_finalproject/widgets/home_meeting_button.dart';

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
      body: Column(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(onPressed: (){},
                  text: 'New Meeting',
                  icon: Icons.videocam,
                ),
                HomeMeetingButton(onPressed: (){},
                  text: 'Join Meeting',
                  icon: Icons.add_box_rounded,
                ),
                HomeMeetingButton(onPressed: (){},
                  text: 'Schedule',
                  icon: Icons.calendar_today,
                ),
                HomeMeetingButton(onPressed: (){},
                  text: 'Share Screen',
                  icon: Icons.arrow_upward,
                )
              ],
            ),
        ],
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

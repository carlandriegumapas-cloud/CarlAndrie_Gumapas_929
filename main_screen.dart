
import 'package:flutter/material.dart';
import 'package:widgets/screens/friends_screen.dart';
import 'package:widgets/screens/newsfeed_screen.dart';
import 'package:widgets/screens/notification_screen.dart';
import 'package:widgets/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;

  final List<Widget> pages = const [
    NewsfeedScreen(),
    FriendsScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.new_label),
            label: "News Feed",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.person),
            label: "Friends",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.person_2),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
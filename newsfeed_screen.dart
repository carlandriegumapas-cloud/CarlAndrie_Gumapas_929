import 'package:flutter/material.dart';
import 'package:widgets/components/globalappbar_component.dart';
import 'package:widgets/components/newsfeedcomponent.dart';

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {

  final List<Map<String, String>> newsfeed = [
    {
      "username": "John Doe",
      "status": "Having a great day!",
      "likes": "120",
      "comments": "25",
      "shares": "10",
      "time": "Just Now",
    },
    {
      "username": "Jane Smith",
      "status": "Learning Flutter is fun!",
      "likes": "250",
      "comments": "40",
      "shares": "15",
      "time": "2 hours ago",
    },
    {
      "username": "Michael Cruz",
      "status": "Working on my new project.",
      "likes": "89",
      "comments": "12",
      "shares": "4",
      "time": "2 hours ago",
    },
    {
  "username": "Carl Gumapas",
  "status": "Activity 1",
  "likes": "100",
  "comments": "10",
  "shares": "11",
  "time": "2 hours ago",
    },
    {
  "username": "Eric Man",
  "status": "Veyr Hard",
  "likes": "150",
  "comments": "15",
  "shares": "2",
  "time": "11 hours ago",
    },
    {
  "username": "Tiffany Knows",
  "status": "9-5 Work Tough Day!",
  "likes": "500",
  "comments": "30",
  "shares": "18",
  "time": "3 hours ago",
   },
   {
  "username": "Maximum Power",
  "status": "Defense",
  "likes": "10",
  "comments": "1",
  "shares": "0",
  "time": "10 hours ago",
   },
   {
  "username": "Mira Cle",
  "status": "Best Wishes",
  "likes": "101",
  "comments": "67",
  "shares": "30",
  "time": "5 hours ago",
   },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalappbarComponent(),

      body: ListView.builder(
        padding: const EdgeInsets.all(10),

        itemCount: newsfeed.length,

        itemBuilder: (context, index) {
          final post = newsfeed[index];

          return Newsfeedcomponent(
            username: post["username"],
            status: post["status"],
            numberoflikes: post["likes"],
            numberofcomments: post["comments"],
            numberofshares: post["shares"],
            timeposted: post["time"],
          );
        },
      ),
    );
  }
}

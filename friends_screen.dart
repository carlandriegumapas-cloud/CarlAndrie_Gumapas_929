import 'package:flutter/material.dart';
import 'package:widgets/components/globalappbar_component.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalappbarComponent(),

      body: Center(
        child: Text("Friends Screen"),
      ),
    );
  }
}
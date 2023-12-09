import 'package:flutter/material.dart';
import 'package:music_player_app/widgets/bottomnav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NavBar(finalindex: 0));
  }
}

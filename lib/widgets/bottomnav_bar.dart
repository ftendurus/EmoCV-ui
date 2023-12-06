import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:music_player_app/screens/main_menu_screen.dart';
import 'package:music_player_app/screens/profile_page/profile_page.dart';
import 'package:music_player_app/screens/search_page.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/song.dart';
import '../providers/songs_provider.dart';
import '../widgets/main_menu_song_player.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';


class NavBar extends StatefulWidget {
  int finalindex;

  NavBar({Key? key, required this.finalindex}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final widgetOptions = [
    const MainMenuScreen(),
    const SearchPage(),
    const ProfilePage()
  ];


  @override
  Widget build(BuildContext context) {
    List<Song> songsData =
        Provider.of<SongsProvider>(context, listen: false).songsProviderList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_colors.pinkPrimary,
        elevation: 0,
        title: const Text(
          'EmoCV',
          style: TextStyle(
            fontSize: 28,
            letterSpacing: 1,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawerEnableOpenDragGesture: true, // Bu özelliği kullanın
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 0), // Offset'ı sağa doğru ayarlayın
            ),
          ],
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 100,
                child: DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("lib/images/aa.png"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 3),
                          GestureDetector(
                            // onTap: () => Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) {
                            //     return const ProfilePage();
                            //   }),
                            // ),
                            child: Text(
                              "View Profile",
                              style: TextStyle(
                                color: custom_colors.pinkPrimary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: custom_colors.pinkPrimary,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const SettingsPage();
                  // }));
                },
              ),
              ListTile(
                title: Text("Playing Song"),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const SongPage();
                  // }));
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Display the current page
          widgetOptions[widget.finalindex],
          // Display the MainMenuSongPlayer above the BottomNavigationBar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: MainMenuSongPlayer(songsData[0]),// Pass the current song to the widget
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: custom_colors.blackSecondary,
        child: GNav(
          selectedIndex: widget.finalindex,
          onTabChange: (index) {
            setState(() {
              widget.finalindex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          color: Colors.white,
          activeColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
      ),
    );
  }
}

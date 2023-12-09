import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player_app/screens/library_page.dart';
import 'package:music_player_app/screens/playlist_screen.dart';
import 'package:music_player_app/screens/main_menu_screen.dart';
import 'package:music_player_app/screens/profile_page/profile_page.dart';
import 'package:music_player_app/screens/search_page.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/song.dart';
import '../providers/songs_provider.dart';
import '../screens/settings_page.dart';
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
    const LibraryPage(),
    const PlaylistScreen()
  ];
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    List<Song> songsData =
        Provider.of<SongsProvider>(context, listen: false).songsProviderList;

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              custom_colors.pinkPrimary,
              custom_colors.blackSecondary.withOpacity(0.7)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        backgroundColor: custom_colors.background,
        appBar: AppBar(
          backgroundColor: custom_colors.pinkPrimary,
          title: const Text('EmoCV', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
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
              child: MainMenuSongPlayer(
                  songsData[0]), // Pass the current song to the widget
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                custom_colors.blackSecondary
                    .withOpacity(1.0), // Dark color at the bottom
                custom_colors.blackSecondary
                    .withOpacity(0.7), // Intermediate color
                custom_colors.blackSecondary
                    .withOpacity(0.0), // Light color at the top
              ],
            ),
          ),
          child: GNav(
            rippleColor: custom_colors.pinkPrimary,

            hoverColor: custom_colors.pinkPrimary.withOpacity(0.2),
            gap: 8,
            activeColor: Colors.white,
            iconSize: 30, // Adjust the icon size as needed
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 16), // Adjust the padding as needed
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.transparent,
            color: Colors.white,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.book,
                text: 'Library',
              ),
            ],
            selectedIndex: widget.finalindex,
            onTabChange: (index) {
              setState(() {
                widget.finalindex = index;
              });
            },
          ),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 10.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'lib/images/aa.png',
                  ),
                ),
                Container(
                  child: Text(
                    "Username",
                    style: TextStyle(color: Colors.white),
                  ),
                  margin: EdgeInsets.only(bottom: 64),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    _advancedDrawerController.hideDrawer();

                    // Navigate to the SettingsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {
                    _advancedDrawerController.hideDrawer();

                    // Navigate to the SettingsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

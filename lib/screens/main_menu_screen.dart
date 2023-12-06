import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../models/colors.dart' as custom_colors;
import '../models/song.dart';
import '../providers/playlists_provider.dart';
import '../providers/songs_provider.dart';
import '../widgets/main_menu_song_player.dart';
import '../widgets/playlist_card.dart';
import '../widgets/song_list.dart';
import '../models/playlist.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Playlist> playlistsData =
        Provider.of<PlaylistsProvider>(context, listen: false)
            .playlistsProviderList;
    List<Song> songsData =
        Provider.of<SongsProvider>(context, listen: false).songsProviderList;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 290,
              width: double.infinity,
              child: Stack(
                children: [
                  // Pink 240 container
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: custom_colors.pinkPrimary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                  ),

                  // Playlist
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Playlists',
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Icon(
                                    Icons.collections_bookmark_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: playlistsData.length,
                              itemBuilder: (_, index) {
                                return PlaylistCard(playlistsData[index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Expanded(
              child: SongList(),
            )
          ],
        ),
      ],
    );
  }
}

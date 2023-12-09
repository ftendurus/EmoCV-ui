import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../card/playlist_card.dart';
import '../models/playlist.dart';
import '../providers/playlists_provider.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    List<Playlist> playlistsData =
        Provider.of<PlaylistsProvider>(context, listen: false)
            .playlistsProviderList;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Library',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 2, // Adjust the thickness of the line as needed
            color: Colors.black, // Adjust the color of the line as needed
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playlistsData.length,
              itemBuilder: ((context, index) {
                return PlaylistCard(playlist: playlistsData[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

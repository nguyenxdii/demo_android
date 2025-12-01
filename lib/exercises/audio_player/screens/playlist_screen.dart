import 'package:flutter/material.dart';
import '../models/song.dart';
import 'player_screen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = Song.getSongs();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Playlist Của Tôi"),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: songs.length,
        separatorBuilder: (ctx, i) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final song = songs[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  song.coverImage,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Colors.grey, width: 55, height: 55),
                ),
              ),
              title: Text(
                song.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                song.artist,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(
                Icons.play_circle_filled_rounded,
                color: Colors.indigoAccent,
                size: 32,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlayerScreen(songs: songs, initialIndex: index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:demo_android/exercises/audio_player/screens/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'exercises/character_wiki/screens/character_list_screen.dart';
import 'exercises/temperature_converter/temperature_converter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MasterMenuScreen(),
    );
  }
}

// man hinh chinh
class MasterMenuScreen extends StatelessWidget {
  const MasterMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Sách Bài Tập'),
        // centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Chọn Bài Tập:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // nút bấm vào bài tập charactor wiki
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CharacterListScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Bài 1: Wuwa Wiki"),
              ),
            ),

            SizedBox(height: 10),

            // bài đổi nhiệt độ
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TemperatureConverterScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Bài 2: Chuyển nhiệt độ"),
              ),
            ),

            SizedBox(height: 10),

            // demo audio player
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaylistScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Bài 3: demo Audio Player"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

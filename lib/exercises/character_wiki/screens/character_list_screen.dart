import 'package:demo_android/exercises/character_wiki/models/character.dart';
import 'package:flutter/material.dart';
import 'character_detail_screen.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Character> characters = Character.getCharacters();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wuwa Wiki"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: Hero(
                tag: character.name,
                child: CircleAvatar(
                  backgroundImage: AssetImage(character.imageUrl),
                  backgroundColor: Colors.grey[200],
                  radius: 25,
                ),
              ),

              // ten nhan vat
              title: Text(
                character.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              // thong so phu
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    // badge do hiem
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        character.rarity,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // ten he
                    Text(
                      character.element,
                      style: TextStyle(
                        color: character.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),

              // nhan vao chuyen sang details
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CharacterDetailScreen(character: character),
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

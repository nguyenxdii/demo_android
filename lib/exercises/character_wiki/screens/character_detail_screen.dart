import 'package:demo_android/exercises/character_wiki/models/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: character.color,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // anh dau trang
            Hero(
              tag: character.name,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: AssetImage(character.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // thong tin chi tiet
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ten vu khi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Chip(
                        avatar: const Icon(Icons.security, size: 18),
                        label: Text(character.weapon),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // thong so element va rarity
                  Row(
                    children: [
                      _buildInfoTag(
                        "Element",
                        character.element,
                        character.color,
                      ),
                      const SizedBox(width: 10),
                      _buildInfoTag("Rarity", character.rarity, Colors.orange),
                    ],
                  ),

                  const SizedBox(height: 25),
                  const Divider(),
                  const SizedBox(height: 15),

                  // Mô tả (Story)
                  const Text(
                    "Story / Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    character.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm nhỏ để vẽ các cái thẻ đẹp
  Widget _buildInfoTag(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          Text(value, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}

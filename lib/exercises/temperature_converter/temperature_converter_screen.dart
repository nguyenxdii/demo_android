import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreen();
}

class _TemperatureConverterScreen extends State<TemperatureConverterScreen> {
  final TextEditingController _controller = TextEditingController();

  double _fahrenhit = 0.0;

  void _convertTemperature() {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập nhiệt độ chuyển đổi'),
          duration: Duration(seconds: 4),
        ),
      );
      return;
    }

    double celsius = double.tryParse(_controller.text) ?? 0;

    setState(() {
      _fahrenhit = (celsius * 1.8) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHUYỂN ĐƠN VỊ NHIỆT ĐỘ"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // nhan tieu de
            const Text(
              "Nhập nhiệt độ C:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ví dụ 25',
              ),
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // ket qua
            const Text(
              "Nhiệt độ  F là:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // hien do F
            Center(
              child: Text(
                _fahrenhit.toStringAsFixed(1), // lm tron 1 so thap phan
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            const Center(
              child: Text(
                "độ",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _convertTemperature,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.swap_vert, color: Colors.white),
      ),
    );
  }
}

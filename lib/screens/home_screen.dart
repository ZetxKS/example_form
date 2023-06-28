import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slava test")),
      body: const Center(child: TextFieldExample()),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            onChanged: (String value) => this.value = value,
          ),
          ElevatedButton(
            onPressed: () {
              request(value);
            },
            child: const Text("Send"),
          ),
        ],
      ),
    );
  }
}

Future<void> request(String? parameter) async {
  final dio = Dio();
  final response = await dio.get('https://example.com/test.php?param=$parameter');
  print(response.data);
}

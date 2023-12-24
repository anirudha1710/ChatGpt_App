import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'HomePage.dart';

Future<void> main() async{
  await dotenv.load(fileName: ".env");
  runApp(const chat_gpt_app());
}

class chat_gpt_app extends StatelessWidget {
  const chat_gpt_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter and ChatGPT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
    ),
      home: const HomePage(),
    );
  }
}

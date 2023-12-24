import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'PromptBldr.dart';
import 'ResponseModel.dart';
import 'TextFromFieldBldr.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController promptController;
  String responseTxt = '';
  late ResponseModel _responseModel;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff343541),
      appBar: AppBar(
        title: const Text(
          'ChatGPT App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff343541),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PromptBldr(responseTxt: responseTxt),
            TextFormFieldBldr(
              promptController: promptController, btnFun: completionFun
            ),
          ],
        ),
      ),
    );
  }
  completionFun() async{
    setState(() => responseTxt = 'Loading.....');

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${dotenv.env['token']}',
        },
        body: jsonEncode(
          {
            "model": "text-davinci-003",
            "prompt": promptController.text,
            "max_tokens": 250,
            "temperature": 0,
            "top_p": 1,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Assuming your ResponseModel has a named constructor like `fromJson`
        final responseModel = ResponseModel.fromJson(responseData);

        setState(() {
          _responseModel = responseModel;
          responseTxt = _responseModel.choices[0]['text'];
          debugPrint(responseTxt);
        });
      } else {
        // Handle non-200 status codes
        setState(() => responseTxt = 'Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      setState(() => responseTxt = 'Exception: $e');
    }
  }
}
//yooooooooo
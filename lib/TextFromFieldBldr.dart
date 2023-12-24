import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TextFormFieldBldr extends StatelessWidget {
  const TextFormFieldBldr({
        super.key,
        required this.promptController,
        required this.btnFun
  });
  final TextEditingController promptController;
  final Function btnFun;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom:50),
        child: Row(
          children: [
            Flexible(
                child: TextFormField(
                  cursorColor: Colors.white,
                  controller: promptController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff444653),
                      ),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff444653),
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(0xff444653),
                    hintText: 'Ask me anything!',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
            ),
            Container(
              color: const Color(0xff19bc99),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () => btnFun(),
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromptBldr extends StatelessWidget {
  const PromptBldr({
    super.key,
    required this.responseTxt,
  });
  final String responseTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.35,
      color: const Color(0xff434654),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Text(
              responseTxt,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white
              ),
            ),
          )
        ),
      ),
    );
  }
}

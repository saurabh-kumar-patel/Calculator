import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.text,
    required this.callback,
    required this.textcolor,
  });
  final String text;

  final Function callback;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.22,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: () {
          callback(text);
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w900, color: textcolor),
        ),
      ),
    );
  }
}

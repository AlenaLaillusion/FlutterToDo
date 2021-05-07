
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset('assets/images/bg2.jpeg').image,
          fit: BoxFit.contain,
      ),),
    );
  }
}

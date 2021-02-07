import 'package:flutter/material.dart';

import '../../constants.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;

  Logo({
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logoUrl,
      width: width,
      height: height,
    );
  }
}

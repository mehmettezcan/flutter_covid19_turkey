import 'dart:math';

import 'package:flutter/material.dart';

class RotatedIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90 * pi / 180,
      child: Icon(Icons.flight),
    );
  }
}

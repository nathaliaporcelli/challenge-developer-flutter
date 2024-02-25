import 'package:flutter/material.dart';

class CeslaImage extends StatelessWidget {
  final String path;

  const CeslaImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      package: 'design_system',
    );
  }
}

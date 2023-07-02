//square tile for the signature image

import 'package:flutter/material.dart';

class signatureSquareTile extends StatelessWidget {
  final String imagePath;
  const signatureSquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      child: Image.asset(imagePath, height: 100, width: 2000),
    );
  }
}

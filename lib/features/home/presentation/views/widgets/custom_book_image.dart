import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.borderRadies});
  final BorderRadius? borderRadies;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150/224,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadies ?? BorderRadius.circular(17) ,
          color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.testImage),),
        ),
      ),
    );
  }
}


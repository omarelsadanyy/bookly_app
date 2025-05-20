import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,this.mainAxisAlignment  = MainAxisAlignment.start});
 final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          size: 20,
          Icons.star,
        color: Color(0xffFFDD4F),),
        const SizedBox(width: 6.3,),
        Text('4.8',style: Styles.textStyle16,),
        const SizedBox(width: 9,),
        Text('(2454)',style: Styles.textStyle14.copyWith(
          color:Colors.white.withValues(alpha: .7),)
        ),
      
      ],
    );
  }
}
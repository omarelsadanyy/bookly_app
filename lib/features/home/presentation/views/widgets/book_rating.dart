import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,this.mainAxisAlignment  = MainAxisAlignment.start, required this.rating, required this.reviewsCount});
 final MainAxisAlignment mainAxisAlignment;
 final num rating;
  final int reviewsCount;
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
        Text('$rating',style: Styles.textStyle16,),
        const SizedBox(width: 9,),
        Text('($reviewsCount)',style: Styles.textStyle14.copyWith(
          color:Colors.white.withValues(alpha: .7),)
        ),
      
      ],
    );
  }
}
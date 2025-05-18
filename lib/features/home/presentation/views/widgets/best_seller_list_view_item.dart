import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        children: [
         AspectRatio(
        aspectRatio: 70/105,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetsData.testImage),),
          ),
        ),
      ),
      const SizedBox(width: 30,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text('Harry Potter and the Goblet of Fire',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle20.copyWith(
                fontFamily: kGTSectraFine
              ),),
            ),
            const SizedBox(height: 2),
            Text('J.K. Rowling',
            style: Styles.textStyle14.copyWith(
          color: Color(0xff797682)
        ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('19.99 €',
                style:Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold
                ) ,),
                BookRating()
              ],
            )
          ],
        ),
      )
        ],
      ),
    );
  }
}


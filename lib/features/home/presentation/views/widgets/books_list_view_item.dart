import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetailsView', extra: bookModel);
      },
      child: SizedBox(
        height: 115,
        child: Row(
          children: [
          CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',),
        const SizedBox(width: 30,),
        Expanded(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(bookModel.volumeInfo.title ?? 'No Title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20.copyWith(
                  fontFamily: kGTSectraFine
                ),),
              ),
              const SizedBox(height: 2),
              Text(bookModel.volumeInfo.authors?[0] ?? 'No Author',
              style: Styles.textStyle14.copyWith( ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Free',
                  style:Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold
                  ) ,),
                  BookRating(
                    rating: bookModel.volumeInfo.averageRating ?? 0,
                    reviewsCount: bookModel.volumeInfo.ratingsCount ?? 0,
                  )
                ],
              )
            ],
          ),
        )
          ],
        ),
      ),
    );
  }
}


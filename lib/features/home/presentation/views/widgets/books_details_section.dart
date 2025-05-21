import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomBookDetailsAppBar(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .27, vertical: 30),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',),
        ),
        Text(
          bookModel.volumeInfo.title ?? '',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          bookModel.volumeInfo.authors?.join(', ') ?? '',  
          style: Styles.textStyle18.copyWith(
            color: Colors.white.withValues(alpha: .7),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 14),
        BookRating(mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0,
          reviewsCount: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: BooksAction(),
        ),
      ],
    );
  }
}


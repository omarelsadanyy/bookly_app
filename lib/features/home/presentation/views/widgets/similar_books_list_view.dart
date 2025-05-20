import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
       height: MediaQuery.of(context).size.height * .12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 6),
           child: CustomBookImage(
            borderRadies: BorderRadius.circular(7),
           ),
         );
      },),
    );
  }
}

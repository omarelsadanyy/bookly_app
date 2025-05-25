import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomButton(
          text: 'Free',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
        )),
         Expanded(child: CustomButton(
          onPressed: () {
            _launchUrl(context);
          },
          fontsize: 16,
          text: getText(bookModel),
          backgroundColor: Color(0xffEF8262),
          textColor: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15),),
        ))
      ],
    );  
  }

   Future<void> _launchUrl(context) async {
    if (bookModel.volumeInfo.previewLink == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preview link not available'),
        ),
      );
    } else {
  Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
    if (await canLaunchUrl(uri)) {
  await launchUrl(uri);
    }else{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Could not launch ${bookModel.volumeInfo.previewLink}'),
    ),
  );
    }
}
}

  String getText(BookModel bookModel) {
     if(bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {  
      return 'Preview';
  }
}
}

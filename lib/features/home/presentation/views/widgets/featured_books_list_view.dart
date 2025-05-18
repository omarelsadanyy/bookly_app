import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/cupertino.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
       height: MediaQuery.of(context).size.height * .28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: FeaturedListView(),
         );
      },),
    );
  }
}

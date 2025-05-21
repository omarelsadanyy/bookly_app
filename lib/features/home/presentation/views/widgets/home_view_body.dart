
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child:  Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomAppBar(),
                ),
                FeaturedBooksListView(),
                Padding(
                  padding: EdgeInsets.only(top: 49,bottom: 20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Newest Books',
                    style: Styles.textStyle18),
                  ),
                ),
               
             ],
            )
          ),
           BestSellerListView(),      
        ],
    ); 
        
  }
}










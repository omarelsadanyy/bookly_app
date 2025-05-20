import 'package:bookly_app/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
       slivers: [
        SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomSearchTextField(),
            const SizedBox(height: 16),  
          ],
          
        ),
        
      ),
      
        ),
         SearchResultListView()
       ],
    );
  }
}


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return   SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: BooksListViewItem(),
              );
            },
            childCount: 20, // Number of items in your list
          ),
        );
  }
}


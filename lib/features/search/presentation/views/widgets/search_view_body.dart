import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  
//List<BookModel> books = [];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [CustomSearchTextField(), const SizedBox(height: 16)],
            ),
          ),
        ),
        SearchResultListView(),
      ],
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is SearchLoading){
          return SliverToBoxAdapter(child: const CustomLoadingIndicator());
        }
        if(state is SearchFailure){
          return SliverToBoxAdapter(child: CustomErrorWidget(errMessage: state.errorMessage));
        }
        if (state is SearchSuccess){
          if (state.books.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('No results found'),
              ),
            );
          }
          return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 20,
                ),
                 child: BooksListViewItem(bookModel: state.books[index]),
              );
            },
            childCount: state.books.length, // Number of items in your list
          ),
        );
        }
        return const SliverToBoxAdapter(
          child: Center(
            child: Text('Search for books to see results'),
          ),
        );
      },
    );
  }
}

import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: BooksListViewItem(bookModel: state.books[index]),
        );
      },
      childCount: state.books.length,  // Adjust based on your data source
    ),
  );
}else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errorMessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}

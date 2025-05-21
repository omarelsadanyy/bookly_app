import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .12,
    child: ListView.builder(
      itemCount: state.similarBooks.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: CustomBookImage(borderRadies: BorderRadius.circular(7),
          imageUrl:state.similarBooks[index].volumeInfo.imageLinks?.thumbnail ?? '',),
        );
      },
    ),
  );
} else if (state is SimilarBooksFailure){
  return CustomErrorWidget(errMessage: state.errorMessage);
} else {
  return const CustomLoadingIndicator();
}
      },
    );
  }
}

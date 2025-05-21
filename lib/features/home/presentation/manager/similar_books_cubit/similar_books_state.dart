part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> similarBooks;

  const SimilarBooksSuccess(this.similarBooks);

  @override
  List<Object> get props => [similarBooks];
}
final class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

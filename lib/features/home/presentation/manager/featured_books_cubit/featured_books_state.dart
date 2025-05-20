part of 'featured_books_cubit.dart';

sealed class FeaturedbooksState extends Equatable {
  const FeaturedbooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedbooksInitial extends FeaturedbooksState {}
final class FeaturedbooksLoading extends FeaturedbooksState {}
final class FeaturedbooksSuccess extends FeaturedbooksState {
  final List<BookModel> books;

  const FeaturedbooksSuccess(this.books);
}
final class FeaturedbooksFailure extends FeaturedbooksState {
  final String errorMessage;

  const FeaturedbooksFailure(this.errorMessage);
}

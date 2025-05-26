import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  
final SearchRepo searchRepo;
TextEditingController searchController = TextEditingController();

  Future<void> fetchSearchedBooks() async{
    if(searchController.text.isEmpty){
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
   var result = await searchRepo.fetchSearchResults(searchController.text);
   result.fold((failure){
    emit(SearchFailure(failure.errMessage));
   }, (books){
    emit(SearchSuccess(books));
   });

  }
}

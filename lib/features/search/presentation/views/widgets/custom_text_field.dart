import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: BlocProvider.of<SearchCubit>(context).searchController,
      onChanged: (value) {
        BlocProvider.of<SearchCubit>(context).searchController.text=value;
        BlocProvider.of<SearchCubit>(context).fetchSearchedBooks();
      },
      decoration: InputDecoration(
        enabledBorder: textFieldOutlindTnputBorder(),
        focusedBorder: textFieldOutlindTnputBorder(),
        hintText: 'Search For Books...',
        suffixIcon: IconButton(onPressed: (){}, icon:  Opacity(
          opacity: .8,
          child: SvgPicture.asset(
              AssetsData.serachIcon,
              width: 25,
              height: 25,
            ),
            
        )),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: (){
            BlocProvider.of<SearchCubit>(context).searchController.clear();
            BlocProvider.of<SearchCubit>(context).fetchSearchedBooks();
            
          }, icon: Opacity(
            opacity: .8,
            child: Icon(Icons.close, color: Colors.white, size: 25,),
          )),
        ),
      ),
    );
  }

  OutlineInputBorder textFieldOutlindTnputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.white
          )
      );
  }
}
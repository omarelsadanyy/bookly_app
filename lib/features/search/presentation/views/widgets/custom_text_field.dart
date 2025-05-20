import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        ))
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
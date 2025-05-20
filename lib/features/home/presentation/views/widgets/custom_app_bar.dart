import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 45),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsData.logo,
            width: 75,
            height: 16.1,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          IconButton(onPressed: (){
            GoRouter.of(context).go('/SearchView');
          }, icon:  SvgPicture.asset(
            AssetsData.serachIcon,
            width: 25,
            height: 25,
          )),
        ],
      ),
    ) ;
  }
}
import 'package:flutter/material.dart';
import 'package:trips/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsie;
  double? width;
  ResponsiveButton({Key? key, this.isResponsie = false, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/img/button-one.png"),
        ],
      ),
    );
  }
}

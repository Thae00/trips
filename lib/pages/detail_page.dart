import 'package:flutter/material.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_large_text.dart';
import 'package:trips/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStars = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 50,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu), color: Colors.white,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert), color: Colors.white,),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(30, "Yosemite", Colors.black.withOpacity(0.8)),
                        AppLargeText(30, "\$ 250", AppColors.mainColor),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(text: "USA, California", color: AppColors.textColor1,),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: index < gottenStars ? AppColors.starColor : AppColors.textColor2);
                          }),
                        ),
                        SizedBox(width: 10,),
                        AppText(text: "(4.0)", color: AppColors.textColor2,),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

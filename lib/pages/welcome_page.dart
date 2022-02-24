import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_large_text.dart';
import 'package:trips/widgets/app_text.dart';
import 'package:trips/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(
                        30,
                        "Trips",
                        Colors.black,
                      ),
                      AppText(
                        text: "Mountain",
                        size: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom along with endurance tests",
                          color: AppColors.textColor2,
                          size: 15,
                        ),
                      ),
                      SizedBox(height: 30,),
                      ResponsiveButton(width: 120,),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit_states.dart';
import 'package:trips/cubit/app_cubits.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_buttons.dart';
import 'package:trips/widgets/app_large_text.dart';
import 'package:trips/widgets/app_text.dart';
import 'package:trips/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state){
        DetailState detail = state as DetailState;
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
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/' + detail.place.img,
                        ),
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
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                                30, detail.place.name, Colors.black.withOpacity(0.8)),
                            AppLargeText(30, "\$" + detail.place.price.toString(), AppColors.mainColor),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2);
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(5.0)",
                              color: AppColors.textColor2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          20,
                          "People",
                          Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Number of people in your group",
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  text: (index + 1).toString(),
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 50,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          20,
                          "Description",
                          Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(width: 20,),
                      ResponsiveButton(
                        isResponsie: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

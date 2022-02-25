import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(
              30,
              "Discover",
              Colors.black
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //tabBar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          //tabBarView
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                Text("hi"),
                Text("ins"),
                Text("emoti"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit_states.dart';
import 'package:trips/pages/detail_page.dart';
import 'package:trips/pages/home_page.dart';
import 'package:trips/pages/navpages/main_page.dart';
import 'package:trips/pages/welcome_page.dart';

import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is WelcomeState) {
            return WelcomePage();
          }
          if(state is LoadedState) {
            return MainPage();
          }
          if(state is DetailState) {
            return DetailPage();
          }
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator(),);
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:trips/cubit/app_cubit_states.dart';
import 'package:trips/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{

  final DataServices data;
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  late final places;

  void getData() async {
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {

    }
  }
}
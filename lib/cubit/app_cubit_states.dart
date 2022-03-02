import 'package:equatable/equatable.dart';
import 'package:trips/model/data_model.dart';

abstract class CubitStates extends Equatable{}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;
  LoadedState(this.places);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
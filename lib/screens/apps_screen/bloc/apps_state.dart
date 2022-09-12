part of 'apps_bloc.dart';

abstract class AppsState extends Equatable {
  const AppsState();
}

class AppsLoadingState extends AppsState {
  @override
  List<Object> get props => [];
}

class AppsLoadedState extends AppsState {

  final Apps apps;

  AppsLoadedState(this.apps);

  @override
  List<Object> get props => [apps];
}

// class AppsInitial extends AppsState {
//   @override
//   List<Object> get props => [];
// }

part of 'app_details_bloc.dart';

abstract class AppDetailsState extends Equatable {
  const AppDetailsState();
}

class AppDetailsLoadingState extends AppDetailsState {

  @override
  List<Object> get props => [];
}

class AppDetailsLoadedState extends AppDetailsState {

  final AppInfoM app;

  AppDetailsLoadedState({required this.app});

  @override
  List<Object> get props => [app];
}

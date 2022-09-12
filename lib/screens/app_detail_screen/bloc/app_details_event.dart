part of 'app_details_bloc.dart';

abstract class AppDetailsEvent extends Equatable {
  const AppDetailsEvent();
}

class LoadAppApiEvent extends AppDetailsEvent{

  final String appId;

  LoadAppApiEvent({required this.appId});

  @override
  // TODO: implement props
  List<Object?> get props => [appId];

}
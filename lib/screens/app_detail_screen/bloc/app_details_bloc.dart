import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn1/model/app_info.dart';

import '../../../data/data_source/remote/api.dart';

part 'app_details_event.dart';
part 'app_details_state.dart';

class AppDetailsBloc extends Bloc<AppDetailsEvent, AppDetailsState> {

  final AppApi _api;

  AppDetailsBloc(this._api) : super(AppDetailsLoadingState()) {
    on<LoadAppApiEvent>((event, emit) async {
      final app = await _api.getAppInfo(event.appId);
      emit(AppDetailsLoadedState(app: app));
    });
  }
}

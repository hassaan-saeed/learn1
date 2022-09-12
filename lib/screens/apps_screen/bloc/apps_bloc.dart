import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/data_source/remote/api.dart';
import '../../../model/app.dart';

part 'apps_event.dart';
part 'apps_state.dart';

class AppsBloc extends Bloc<AppsEvent, AppsState> {

  final AppApi _api;
  AppsBloc(this._api) : super(AppsLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      final apps = await _api.getApps();
      emit(AppsLoadedState(apps));
    });
  }
}

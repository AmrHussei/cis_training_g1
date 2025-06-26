import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cis_training_g1/features/home/data/repository/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/all_home_data_model.dart';
import '../../../data/models/person_details_model.dart';
import '../../../data/models/person_images_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeState());

  final HomeRepository _homeRepository;
  int personId = 0;

  void getAllHomeData() async {
    emit(state.copyWith(getAllHomeDataRequestState: RequestState.loading));
    final result = await _homeRepository.getAllHomeData();

    result.fold(
      (failure) {
        emit(state.copyWith(
          getAllHomeDataRequestState: RequestState.error,
          getAllHomeDataError: failure,
        ));
        log(failure.toString());
      },
      (model) {
        emit(
          state.copyWith(
            getAllHomeDataRequestState: RequestState.loaded,
            getAllHomeDataModel: model,
          ),
        );
      },
    );
  }

  void getPersonInfoById() async {
    emit(state.copyWith(getPersonInfoByIdRequestState: RequestState.loading));
    final result = await _homeRepository.getPersonInfoById(personId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          getPersonInfoByIdRequestState: RequestState.error,
          getPersonInfoByIdError: failure,
        ));
        log(failure.toString());
      },
      (model) {
        emit(
          state.copyWith(
            getPersonInfoByIdRequestState: RequestState.loaded,
            getPersonInfoByIdModel: model,
          ),
        );
      },
    );
  }

  void getPersonImages() async {
    emit(state.copyWith(getPersonImageRequestState: RequestState.loading));
    final result = await _homeRepository.getPersonImages(personId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          getPersonImageRequestState: RequestState.error,
          getPersonImageError: failure,
        ));
        log(failure.toString());
      },
      (model) {
        emit(state.copyWith(
          getPersonImageRequestState: RequestState.loaded,
          getPersonImageModel: model,
        ));
      },
    );
  }
}

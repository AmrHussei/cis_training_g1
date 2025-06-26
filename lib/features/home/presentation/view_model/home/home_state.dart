// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.getAllHomeDataRequestState = RequestState.ideal,
    this.getAllHomeDataError,
    this.getAllHomeDataModel,
    this.getPersonInfoByIdRequestState = RequestState.ideal,
    this.getPersonInfoByIdError,
    this.getPersonInfoByIdModel,
    this.getPersonImageRequestState = RequestState.ideal,
    this.getPersonImageError,
    this.getPersonImageModel,
  });

  final RequestState getAllHomeDataRequestState;
  final Failure? getAllHomeDataError;
  final AllHomeDataModel? getAllHomeDataModel;
  //
  final RequestState getPersonInfoByIdRequestState;
  final Failure? getPersonInfoByIdError;
  final PersonDetailsModel? getPersonInfoByIdModel;
  //
  final RequestState getPersonImageRequestState;
  final Failure? getPersonImageError;
  final PersonImagesModel? getPersonImageModel;

  @override
  List<Object?> get props => [
        getAllHomeDataRequestState,
        getAllHomeDataError,
        getAllHomeDataModel,
        getPersonInfoByIdRequestState,
        getPersonInfoByIdError,
        getPersonInfoByIdModel,
        getPersonImageRequestState,
        getPersonImageError,
        getPersonImageModel,
      ];

  HomeState copyWith({
    RequestState? getAllHomeDataRequestState,
    Failure? getAllHomeDataError,
    AllHomeDataModel? getAllHomeDataModel,
    RequestState? getPersonInfoByIdRequestState,
    Failure? getPersonInfoByIdError,
    PersonDetailsModel? getPersonInfoByIdModel,
    RequestState? getPersonImageRequestState,
    Failure? getPersonImageError,
    PersonImagesModel? getPersonImageModel,
  }) {
    return HomeState(
      getAllHomeDataRequestState:
          getAllHomeDataRequestState ?? this.getAllHomeDataRequestState,
      getAllHomeDataError: getAllHomeDataError ?? this.getAllHomeDataError,
      getAllHomeDataModel: getAllHomeDataModel ?? this.getAllHomeDataModel,
      getPersonInfoByIdRequestState:
          getPersonInfoByIdRequestState ?? this.getPersonInfoByIdRequestState,
      getPersonInfoByIdError:
          getPersonInfoByIdError ?? this.getPersonInfoByIdError,
      getPersonInfoByIdModel:
          getPersonInfoByIdModel ?? this.getPersonInfoByIdModel,
      getPersonImageRequestState:
          getPersonImageRequestState ?? this.getPersonImageRequestState,
      getPersonImageError: getPersonImageError ?? this.getPersonImageError,
      getPersonImageModel: getPersonImageModel ?? this.getPersonImageModel,
    );
  }
}

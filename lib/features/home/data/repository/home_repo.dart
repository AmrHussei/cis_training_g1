import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../data_source/home_remote_data_source.dart';
import '../models/all_home_data_model.dart';
import '../models/person_details_model.dart';
import '../models/person_images_model.dart';

class HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepository({
    required this.remoteDataSource,
  });

  Future<Either<Failure, AllHomeDataModel>> getAllHomeData() async {
    try {
      final response = await remoteDataSource.getAllHomeData();
      if (response.statusCode! >= 200 && response.statusCode! <= 202) {
        log('getAllHomeData Status code is 200');
        // log(response.data);

        var data = AllHomeDataModel.fromJson(response.data);
        return Right(data);
      } else {
        log('getAllHomeData Status code is 422');
        return Left(
          AppFailure(
            message: response.data['status_message'],
          ),
        );
      }
    } catch (e) {
      log('getAllHomeData Repository Exception Error: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, PersonDetailsModel>> getPersonInfoById(int id) async {
    try {
      final response = await remoteDataSource.getPersonInfoById(id);
      if (response.statusCode! >= 200 && response.statusCode! <= 202) {
        log('getPersonInfoById Status code is 200');
        // log(response.data);

        var data = PersonDetailsModel.fromJson(response.data);
        return Right(data);
      } else {
        log('getPersonInfoById Status code is 422');
        return Left(
          AppFailure(
            message: response.data['status_message'],
          ),
        );
      }
    } catch (e) {
      log('getPersonInfoById Repository Exception Error: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, PersonImagesModel>> getPersonImages(int id) async {
    try {
      final response = await remoteDataSource.getPersonImages(id);
      if (response.statusCode! >= 200 && response.statusCode! <= 202) {
        log('getPersonImage Status code is 200');
        // log(response.data);

        var data = PersonImagesModel.fromJson(response.data);
        return Right(data);
      } else {
        log('getPersonImage Status code is 422');
        return Left(
          AppFailure(
            message: response.data['status_message'],
          ),
        );
      }
    } catch (e) {
      log('getPersonImage Repository Exception Error: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

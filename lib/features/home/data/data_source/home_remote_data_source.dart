import 'package:cis_training_g1/core/params/home/general_params.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';

class HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSource({required this.apiConsumer});
  GeneralParams generalParams = GeneralParams();

  Future<Response> getAllHomeData() async {
    final response = await apiConsumer.get(
      EndPoint.getAllHomeData,
      query: generalParams.toMap(),
    );
    return response;
  }

  Future<Response> getPersonInfoById(int id) async {
    final response = await apiConsumer.get(
      '${EndPoint.getPersonInfoById}$id',
      query: generalParams.toMap(),
    );
    return response;
  }

  Future<Response> getPersonImage(int id) async {
    final response = await apiConsumer.get(
      '${EndPoint.getPersonImage}$id',
      query: generalParams.toMap(),
    );
    return response;
  }
}

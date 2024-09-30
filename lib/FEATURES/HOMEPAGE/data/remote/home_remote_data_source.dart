

import 'dart:convert';

import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/model/hotels_model.dart';
import 'package:http/http.dart' as http;

import '../../../../common/core/url_route_names.dart';
import '../../domain/entity/params/staff_params.dart';
import 'model/staff_model.dart';

abstract class HomeRemoteDataSource {
  Future<HotelModel> getHotels();
  Future<StaffModel> getStaffs(StaffParams params);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {

  HomeRemoteDataSourceImpl();

  @override
  Future<HotelModel> getHotels() async {
    final response = await http.get(Uri.parse(AppRemoteRoutes.hotels));
    if (response.statusCode == 200) {
      print(HotelModel.fromJson(jsonDecode(response.body)).hotels);
      return HotelModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load hotels');
    }
  }

  @override
  Future<StaffModel> getStaffs(StaffParams params) async {
    final response = await http.get(Uri.parse(AppRemoteRoutes.getStaffsUrl(params)));
    if (response.statusCode == 200) {
      print(StaffModel.fromJson(jsonDecode(response.body)).staffs);
      return StaffModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load staffs');
    }
  }
}
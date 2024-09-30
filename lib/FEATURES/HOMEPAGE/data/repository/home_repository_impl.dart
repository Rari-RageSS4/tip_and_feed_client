import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/home_remote_data_source.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/model/hotels_model.dart';
import '../../domain/entity/params/staff_params.dart';
import '../../domain/repository/home_repository.dart';
import '../remote/model/staff_model.dart';



class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<HotelModel> getHotels() {
    return dataSource.getHotels();
  }
  @override
  Future<StaffModel> getStaffs(StaffParams params) {
    return dataSource.getStaffs(params);
  }
}
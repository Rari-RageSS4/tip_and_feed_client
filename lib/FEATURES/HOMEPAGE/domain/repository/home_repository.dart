import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/model/hotels_model.dart';

import '../../data/remote/model/staff_model.dart';
import '../entity/params/staff_params.dart';

abstract class HomeRepository {
  Future<HotelModel> getHotels();
  Future<StaffModel> getStaffs(StaffParams params);

  } 
//import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/model/hotels_model.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/domain/repository/home_repository.dart';
import '../../../../common/core/usecase.dart';
import '../../data/remote/model/staff_model.dart';
//import '../entity/hotels_entity.dart';
import '../entity/params/staff_params.dart';


class GetStaffsUseCase extends UseCase<StaffEntity, StaffParams> {

  final HomeRepository repository;

  GetStaffsUseCase(this.repository);
  @override
  Future<StaffModel> call(StaffParams params) {
    return repository.getStaffs(params);
  }
}
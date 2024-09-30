import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/model/hotels_model.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/domain/repository/home_repository.dart';
import '../../../../common/core/usecase.dart';
import '../entity/hotels_entity.dart';


class GetHotelsUseCase extends UseCase<HotelsEntity, NoParams> {
  final HomeRepository repository;

  GetHotelsUseCase(this.repository);
  @override
  Future<HotelModel> call(NoParams params) {
    return repository.getHotels();
  }
}
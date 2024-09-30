import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/model/hotels_model.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/data/remote/model/staff_model.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/domain/usecase/get_hotels_usecase.dart';
import 'package:tip_and_feed_client/common/core/usecase.dart';
import '../../../../common/core/response_classify.dart';
import '../../domain/entity/params/staff_params.dart';
import '../../domain/usecase/get_staffs_usecase.dart';


class HomeController extends GetxController {

  final GetHotelsUseCase getHotelsUseCase;
  final GetStaffsUseCase getStaffsUseCase;

  HomeController(this.getHotelsUseCase, this.getStaffsUseCase) {
    getHotels();
  }
  /*
  change pincode varible value search
   */
  String? pincode;
  var isLoading = false.obs;
  RxString selectHotel = 'Select Hotel'.obs;
  RxString selectStaffs = 'Select Staff'.obs;

  //final cartController = Get.find<CartController>();
  // final response = ResponseClassify<HomeEntity>.loading().obs;
  // final allLocationResponse = ResponseClassify<List<RegionModel>>.loading().obs;
  // final nearestLocationResponse = ResponseClassify<RegionModel>.loading().obs;
   final getHotelsResponse = ResponseClassify<HotelModel>.loading().obs;
   final getStaffsResponse = ResponseClassify<StaffModel>.loading().obs;

  getHotels() async {
    getHotelsResponse.value = ResponseClassify.loading();
    try {
      getHotelsResponse.value =
          ResponseClassify.completed(await getHotelsUseCase.call(NoParams()));
      _callGetStaffsInBackground();
    } catch (e) {
      print("error" + e.toString());
    }
  }

  Future<void> getStaffs() async {
    getStaffsResponse.value = ResponseClassify.loading();
    try {
      StaffParams params = StaffParams(hotelId: '1');
      getStaffsResponse.value =
          ResponseClassify.completed(await getStaffsUseCase.call(params));
      // print("products length : ${response.value.data?.products.length}");
    } catch (e) {
      print("error" + e.toString());
    }
  }

  void _callGetStaffsInBackground() async {
    Future.delayed(const Duration(seconds: 1), () async {
      await getStaffs();  // Call getStaffs after a short delay in the background
    });
  }
  final addingData = false.obs;
  var applyOfferResponse = ResponseClassify.error("").obs;

}
import 'package:flutter/cupertino.dart';
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

  String? pincode;
  var isLoading = false.obs;
  RxString selectHotel = 'Select Hotel'.obs;
  RxString selectHotelID = '1'.obs;
  RxString selectStaffs = 'Select Staff'.obs;

  RxDouble billAmount = 0.0.obs;
  TextEditingController totalAmountController = TextEditingController();

  RxDouble tipAmount = 0.0.obs;
  TextEditingController tipAmountController = TextEditingController();

  final getHotelsResponse = ResponseClassify<HotelModel>.loading().obs;
  final getStaffsResponse = ResponseClassify<StaffModel>.loading().obs;
  RxDouble totalAmount =
      0.0.obs; // This will store the final total (bill + tip)

  // Function to calculate the total amount (bill + tip)
  void updateTotalAmount() {
    totalAmount.value = billAmount.value + tipAmount.value;
  }

  void updateBillAmount() {
    // Safely parse the input text and update the bill amount
    billAmount.value = double.tryParse(totalAmountController.text) ?? 0.0;
  }

  void updateTipAmount(double? label) {
    // Safely parse the input text and update the bill amount
    if (label == null) {
      tipAmount.value = double.tryParse(tipAmountController.text) ?? 0.0;
    } else {
      tipAmount.value = label;
    }
  }

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
      StaffParams params = StaffParams(hotelId: selectHotelID.value.trim());
      print(params.hotelId);
      getStaffsResponse.value =
          ResponseClassify.completed(await getStaffsUseCase.call(params));
      // print("products length : ${response.value.data?.products.length}");
    } catch (e) {
      print("error" + e.toString());
    }
  }

  void _callGetStaffsInBackground() async {
    Future.delayed(const Duration(seconds: 1), () async {
      await getStaffs(); // Call getStaffs after a short delay in the background
    });
  }

  final addingData = false.obs;
  var applyOfferResponse = ResponseClassify.error("").obs;
}

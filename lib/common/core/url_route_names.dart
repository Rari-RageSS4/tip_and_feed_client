



 import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/domain/entity/params/staff_params.dart';

const String baseUrl = 'https://api.tipandfeed.com/';


class AppRemoteRoutes {

  static const String hotels = '${baseUrl}Hotels';

  static String getStaffsUrl(StaffParams params) {
    return '${baseUrl}Staffs/GetStaffsByHotel/${params.hotelId}';
  }


  static const imagUrl = "https://vinodakash604.pythonanywhere.com";
  static const phone_auth = "api/v1/generate-otp/";
  static const getToken = "api/v1/verify-otp/";
  static const category = "api/v1/category/";
  static const subCategory = "api/v1/subcategory/";
  static const products = "api/v1/products/";
  static const referal = "api/v1/get_referral_url/";
  static const offers = "api/v1/offers/";
  static const offerApply = "api/v1/apply-coupon/";
  static const home = "api/v1/home/";
  static const cart = "api/v1/cart/";
  static const user = "api/v1/users/";
  static const order_create = "api/v1/order_create/";
  static const orders = "api/v1/orders/";
  static const fav = "api/v1/favourite/";
  static const locations = "api/v1/locations/";
}
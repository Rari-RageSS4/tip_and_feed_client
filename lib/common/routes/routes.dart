import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/login_binding.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/login_page.dart';

import '../../FEATURES/HOMEPAGE/view/tip_home/bindings.dart';
import '../../FEATURES/HOMEPAGE/view/tip_home/screenUi.dart';
import '../../FEATURES/HOMEPAGE/view/tip_pay/screenUi.dart';

class Routes {
  static final routes = [
    //
    GetPage(
        name: AppRoutes.homePage,
        page: () => HomePage(),
        bindings: [HomeBinding()]),

    GetPage(
        name: AppRoutes.tipPage,
        page: () => TipCalculatorScreen(),
        bindings: [HomeBinding()]),

    // GetPage(
    //     name: AppRoutes.cart,
    //     page: () => CartScreen(),
    //     bindings: [HomeBinding()]),
    //
    // GetPage(
    //   name: AppRoutes.addressAdd,
    //   page: () => AddressAddScreen(),
    //   // bindings: [HomeBinding()]
    // ),
    //
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      bindings: [LoginBinding()],
    ),
    //
    // GetPage(
    //     name: AppRoutes.otp,
    //     page: () => OtpPage(),
    //     bindings: [AuthBinding()]),
    //
    // GetPage(
    //     name: AppRoutes.account,
    //     page: () => AccountScreen(),
    //     bindings: [AuthBinding(), ProductBinding(), HomeBinding()]),
    //
    // GetPage(
    //     name: AppRoutes.homescreen,
    //     page: () => HomeScreen(),
    //     bindings: [AuthBinding(), ProductBinding(), HomeBinding()]),
    //
    // GetPage(
    //   name: AppRoutes.reffer,
    //   page: () => ReferralPage(),
    //   // bindings: [AuthBinding(), ProductBinding(), HomeBinding()]
    // ),
    //
    //
    // /*GetPage(
    //     name: AppRoutes.dashBoard,
    //     page: () => DashboardScreen(),
    //     bindings: [HomeBinding(), AuthBinding()]),*/
    //
    //
    // GetPage(
    //     name: AppRoutes.address,
    //     page: () => AddressScreen(),
    //     bindings: [HomeBinding()]),
    // GetPage(
    //     name: AppRoutes.location,
    //     page: () => LocationScreen(),
    //     bindings: [HomeBinding()]),
    // GetPage(
    //     name: AppRoutes.addAddress,
    //     page: () => AddressAddScreen(),
    //     bindings: [AuthBinding()]),
    // GetPage(
    //     name: AppRoutes.orders,
    //     page: () => OrdersList(),
    //     bindings: [ProductBinding()]),
    // GetPage(
    //     name: AppRoutes.products,
    //     page: () => ProductListScreen(),
    //     bindings: [ProductBinding()]),
    // GetPage(
    //     name: AppRoutes.driverHome,
    //     page: () => DriverHome(),
    //     binding: ProductBinding()),
    // GetPage(
    //   name: AppRoutes.timeSlots,
    //   page: () => DateTimeSlot(),
    // ),
    // GetPage(
    //     name: AppRoutes.checkOut,
    //     page: () => CheckoutBottomSheet()
    // )
  ];
}

class AppRoutes {
  static const splashScreen = "/splash";
  static const login = "/login";
  static const timeSlots = "/timeslots";
  static const homePage = "/homePage";
  static const tipPage = "/tipPage";
  static const addAddress = "/addAddress";
  static const checkOut = "/checkOut";
  static const account = "/account";
  static const addressAdd = "/addressAdd";
  static const homescreen = "/homescreen";
  static const cart = "/cart";
  static const otp = "/otp";
  static const productDetails = "/productDetails";
  static const dashBoard = "/dashboard";
  static const address = "/address";
  static const orders = "/orders";
  // static const address = "/address";
  static const location = "/location";
  static const products = "/products";
  static const reffer = "/reffer";
  static const driverHome = "/driver";
// static const products_list = "/products_list";
}

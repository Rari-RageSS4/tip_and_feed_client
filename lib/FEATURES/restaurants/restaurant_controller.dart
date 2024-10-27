import 'package:get/get.dart';
import 'package:tip_and_feed_client/models/restaurant_model.dart';

class RestaurantController extends GetxController {
  var restaurants = <RestaurantModel>[
    RestaurantModel(
      name: 'Cassava - Marriott Hotel',
      imageUrl: 'assets/restaurant/burger.jpg',
      category: 'Kerala • Beverages',
      location: 'Kochi Marriott Hotel, Edappally, Kochi',
      priceForTwo: '₹1400 for two',
      rating: 4.6,
      distance: '22.3 km',
     // isAd: true,
     // offerText: 'Flat 35% off on pre-booking',
    ),
    RestaurantModel(
      name: 'Curry Tree Diner City Side',
      imageUrl: 'assets/restaurant/pancake.jpg',
      category: 'South Indian',
      location: 'Ernakulam, Kochi',
      priceForTwo: '₹700 for two',
      rating: 4.0,
      distance: '0.8 km',
    ),
    RestaurantModel(
      name: 'Curry Tree Diner City Side',
      imageUrl: 'assets/restaurant/pancake.jpg',
      category: 'South Indian',
      location: 'Ernakulam, Kochi',
      priceForTwo: '₹700 for two',
      rating: 4.0,
      distance: '0.8 km',
    ),
  ].obs;
}

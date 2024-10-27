import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/paynow_bottomsheet.dart';
import 'package:tip_and_feed_client/FEATURES/restaurants/restaurant_screen.dart';
import 'package:tip_and_feed_client/models/restaurant_model.dart';
import 'restaurant_controller.dart';

class RestaurantsScreen extends StatelessWidget {
  final RestaurantController controller = Get.put(RestaurantController());
  RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for localities',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Restaurants to explore',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = controller.restaurants[index];
                    return Column(
                      children: [
                        RestaurantTile(restaurant: restaurant),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantTile({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> RestaurantScreen());
        // Get.bottomSheet(
        //   isScrollControlled: true,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        //   ),
        //   Material(
        //     child: PaynowBottomSheet(
        //       restaurant: restaurant,
        //     ),
        //   ),
        // );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Display restaurant image placeholder
                Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Image.asset(
                    restaurant.imageUrl,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
                // if (restaurant.isAd)
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(FontAwesomeIcons.heart),
                ),

                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.green, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(restaurant.category),
                      Text(restaurant.priceForTwo),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.location,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                      Text('${restaurant.distance} away'),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // if (restaurant.offerText.isNotEmpty)
                  // Container(
                  //   margin: const EdgeInsets.only(top: 8),
                  //   padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  //   color: Colors.green[100],
                  //   child: Text(
                  //     restaurant.offerText,
                  //     style: TextStyle(color: Colors.green[800]),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

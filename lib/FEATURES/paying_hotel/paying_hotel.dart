import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/restaurants/restaurant_controller.dart';
import 'package:tip_and_feed_client/models/restaurant_model.dart';

class PayingHotel extends GetView<RestaurantController> {
  final RestaurantModel restaurant;
  const PayingHotel({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    //  var restaurant = controller.restaurants[index];
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const Icon(Icons.arrow_back),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paying: ${restaurant.name}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              restaurant.location,
              style: const TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.question_mark_rounded,
                color: Color.fromARGB(255, 84, 10, 5),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 84, 10, 5),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Your bill'),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '₹200',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '₹170',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[200],
                    ),
                  ),
                ],
              ),
            ),

            // additional offers
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Additional Offers'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(48, 158, 158, 158),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Apply coupons & Bank offers'),
                          Text(
                            'Save ₹17 with DINE150',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // bill details
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Bill Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(48, 158, 158, 158),
                ),
                child: const Column(
                  
                  children: [
                    // total bill amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Total bill amount'), Text('₹600')],
                    ),
                    Divider(),
                    // discount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('15% Regular discount'), Text('-₹60')],
                    ),
                    // convinience fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Convenience fee'), Text('₹10')],
                    ),
                    Divider(),
                    // add tip
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [Icon(Icons.add), Text('Add Tip')],
                        ),
                        Text('₹0')
                      ],
                    ),
                    Divider(),
                    // to pay
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('To Pay'),
                            Text(
                              '(Rounded off)',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                          ],
                        ),
                        Text('₹550')
                      ],
                    )
                  ],
                ),
              ),
            ),

            // pay button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.green,
                ),
                child: const Center(
                    child: Text(
                  'Proceed to pay',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

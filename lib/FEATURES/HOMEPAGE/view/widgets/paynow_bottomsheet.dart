import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/pay_now/paynow_controller.dart';
import 'package:tip_and_feed_client/FEATURES/paying_hotel/paying_hotel.dart';
import 'package:tip_and_feed_client/models/restaurant_model.dart';

class PaynowBottomSheet extends GetView<PaynowBottomSheetController> {
  final RestaurantModel restaurant;
  const PaynowBottomSheet({ required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey[900]),
      width: Get.width,
      height: 450,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PAYING TO',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Hoy Punjab',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Kakkanad, Kochi',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 15,
            ),

            // discout containers
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 10,
                                blurRadius: 2,
                                offset: const Offset(0, 0),
                              )
                            ]),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Guaranteed',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              Text(
                                'Discount',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'FLAT',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '10% Off',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'on total bill',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    // plus

                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 10,
                                blurRadius: 2,
                                offset: const Offset(0, 0),
                              )
                            ]),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Coupon',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              Text(
                                'Offers',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'FLAT',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '10% Off',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "use 'DINE150'",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Positioned(
                  left: 165,
                  top: 65,
                  child: Icon(
                    Icons.add_box_sharp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // textfield
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter amount as shown on the bill',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
                filled: true,
                fillColor: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.grey),
              ),
              onPressed: () {
                Get.to(() => PayingHotel(restaurant: restaurant,));
              },
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentMethodsGrid extends StatelessWidget {

  final List<String> paymentLogos = [
    "assets/hotels/img.png",
    "assets/hotels/img_1.png",
    "assets/hotels/img_2.png",
    "assets/hotels/img_3.png",
    "assets/hotels/img_4.png",
    "assets/hotels/img_5.png",

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Most Responsible",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle "view all" tap
                },
                child: const Text(
                  "view all >>",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          height: 150,
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,// Use this to make GridView fit its content
            physics: const BouncingScrollPhysics(), // Disable GridView scrolling
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: paymentLogos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: .6, // Aspect ratio for each item
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(paymentLogos[index]),
                    fit: BoxFit.cover, // Fits the image to fill the container
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

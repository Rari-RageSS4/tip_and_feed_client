import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/bill_enter_detail.dart';


class TipCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () {
            // Close action
          },
        ),
        centerTitle: true,
        title: Text(
          'Tip And Feed',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          SizedBox(width: 20), // Space on the right side of the AppBar
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RestaurantProfileCard(),
            SizedBox(height: 20),

            // SizedBox(height: 30),
            // // Circular Slider Section (You would implement a custom widget here)
            // CircularPercentWidget(
            //   percent: 15, // Assuming 15% is selected
            // ),
            // SizedBox(height: 30),
            // // Tip and Total Display Section
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     TextRow(label: 'Tip Amount', value: '\$10.38'),
            //     SizedBox(height: 10),
            //     TextRow(label: 'Tip Amount', value: '\$10.38'),
            //     Divider(),
            //     TextRow(label: 'Total Bill', value: '\$75.27', isTotal: true),
            //   ],
            // ),
            BillDetailsPage(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CircularPercentWidget extends StatelessWidget {
  final int percent;

  const CircularPercentWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          CircularProgressIndicator(
            value: percent / 100,
            strokeWidth: 15,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation(Color(0xFF6A3AB2)),
          ),
          // Center text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$percent%',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const TextRow({Key? key, required this.label, required this.value, this.isTotal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.blue : Colors.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }
}

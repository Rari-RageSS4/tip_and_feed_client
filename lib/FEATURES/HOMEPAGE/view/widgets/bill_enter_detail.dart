import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/tip_home/controller.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/tip_box/tip_and_feed.dart';
import 'package:tip_and_feed_client/common/styles/app_gaps.dart';

import 'package:flutter/material.dart';

class BillDetailsPage extends StatefulWidget {
  @override
  State<BillDetailsPage> createState() => _BillDetailsPageState();
}

class _BillDetailsPageState extends State<BillDetailsPage> {
  final HomeController homeController = Get.find<HomeController>();

  String? selectedTip; // State variable to track selected tip

    void updateTip(String label) {
      setState(() {
        selectedTip = label; // Update the selected tip
      });
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading outside the container
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Bill Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Stylish Container
        Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(13.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4), // Shadow positioning
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBillDetailRow('Total bill amount', '₹2,000'),
              const SizedBox(height: 16),
              _buildTipSection(context),
              const SizedBox(height: 16),
              _buildFeedSection(),
              AppGaps.gapMedium,
              Divider(color: Colors.grey[300]),
              Obx(() => _buildTotalRow('To Pay (Rounded off)',
                  homeController.totalAmount.value.toString())),
              AppGaps.gapMedium,
              Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: GestureDetector(
                  onTap: () {
                    // Clear feed functionality here
                  },
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pay >>',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Bill Details Row with an edit icon
  Widget _buildBillDetailRow(String label, String value,
      {Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          Row(
            children: [
              Obx(
                () => Text(
                  homeController.billAmount.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Center(
                  child: Icon(Icons.edit, size: 18, color: Colors.blueAccent)),
            ],
          ),
        ],
      ),
    );
  }

  // Total Row at the bottom of the container
  Widget _buildTotalRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[600],
          ),
        ),
      ],
    );
  }

  // Tip Section
  Widget _buildTipSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'For TIP',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Clear tip functionality
                  },
                  child: const Text(
                    'Clear Tip',
                    style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            Obx(
              () => Text(
                homeController.tipAmount.value.toString(),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            )
          ],
        ),
        GestureDetector(
          // onTap: ()=>Get.bottomSheet(
          //   _buildCustomTipBottomSheet(),
          //   isScrollControlled: true, // Allows the bottom sheet to take up more space
          //   backgroundColor: Colors.transparent,
          // ),
          onTap: () => homeController.getStaffs().then(
                (value) => Get.bottomSheet(
                  BottomUpStaffsBar(),
                  isScrollControlled:
                      true, // Allows the bottom sheet to take up more space
                  backgroundColor: Colors.transparent,
                ),
              ),
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      homeController.selectStaffs.value,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTipButton('₹50', false),
            _buildTipButton('₹80', false),
            _buildTipButton('₹100', false), // This one is selected
            _buildTipOtherButton('Other', false),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomTipBottomSheet() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Makes the bottom sheet take only necessary height
        children: [
          // Header Section with Title and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add custom tip 🙌',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back(); // Close the bottom sheet
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Tip Input Section
          TextField(
            keyboardType: TextInputType.number,
            controller: homeController.tipAmountController,
            onChanged: (value) {
              homeController.updateBillAmount();
            },
            decoration: InputDecoration(
              labelText: 'Enter tip amount',
              labelStyle: TextStyle(color: Colors.indigo.shade400),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.indigo.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.indigo.shade400, width: 2.0),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Confirm Button
          ElevatedButton(
            onPressed: () {
              homeController.updateTipAmount(0);
              homeController.updateTotalAmount();
              Get.back(); // Close the bottom sheet after confirming
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.indigo[400], // Light gray for disabled effect
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Feed Section
  Widget _buildFeedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'For FEED',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Clear feed functionality
                  },
                  child: const Text(
                    'Clear Feed',
                    style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.indigo.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
          ),
          child: GestureDetector(
            onTap: () {
              // Clear feed functionality here
            },
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Clear Feed',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTipButton('₹50', false),
            _buildTipButton('₹80', false),
            _buildTipButton('₹100', false), // This one is selected
            _buildTipButton('Other', false),
          ],
        ),
      ],
    );
  }

  // Tip Button UI
  Widget _buildTipButton(String label, bool isSelected) {
    double value = 0;
    switch (label) {
      case '₹50':
        value = 50;
        break;
      case '₹80':
        value = 80;
        break;
      case '₹100':
        value = 100;
        break;
      default:
        value = 0;
    }

    isSelected = selectedTip == label;

    return GestureDetector(
      onTap: () {
        // Tip button functionality
        homeController.updateTipAmount(value);
        homeController.updateTotalAmount();
        updateTip(label);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange[100] : Colors.grey[200],
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey[400]!,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.orange : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildTipOtherButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(
        _buildCustomTipBottomSheet(),
        isScrollControlled:
            true, // Allows the bottom sheet to take up more space
        backgroundColor: Colors.transparent,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange[100] : Colors.grey[200],
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey[400]!,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.orange : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class RestaurantProfileCard extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant Header with name and location
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.restaurant,
                  size: 48, color: Colors.orangeAccent),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        controller.selectHotel.value,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Casino Hotel, Willingdon Island, Kochi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              // Rank badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Gold',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Points or rating section
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 28),
              const SizedBox(width: 8),
              const Text(
                '4.5/5',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '1200 Points',
                  style: TextStyle(
                    color: Colors.teal[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TipBottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.bottomSheet(
            _buildCustomTipBottomSheet(),
            isScrollControlled:
                true, // Allows the bottom sheet to take up more space
            backgroundColor: Colors.transparent,
          );
        },
        child: const Text('Show Bottom Sheet'),
      ),
    );
  }

  Widget _buildCustomTipBottomSheet() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Makes the bottom sheet take only necessary height
        children: [
          // Header Section with Title and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add custom tip 🙌',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back(); // Close the bottom sheet
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Tip Input Section
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter tip amount',
              labelStyle: const TextStyle(color: Colors.orange),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Confirm Button
          ElevatedButton(
            onPressed: () {
              // Handle confirm action
              Get.back(); // Close the bottom sheet after confirming
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.grey[400], // Light gray for disabled effect
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

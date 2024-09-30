import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/common/routes/routes.dart';
import '../../../../../common/core/response_classify.dart';
import '../../tip_home/controller.dart';


class TaskCardContainer extends StatelessWidget {

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0), // Padding inside the container
      margin: const EdgeInsets.all(25.0), // Margin around the container
      decoration: BoxDecoration(
        color: const Color(0xFFEAE9EF), // Background color for the container
        borderRadius: BorderRadius.circular(16.0), // Rounded corners for the container
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: ()=> showModalBottomSheet(
                context: context,
                builder: (context) => BottomUpBar(),
              ),
          child: HotelCard()), // First task card
          // SizedBox(height: 16.0), // Space between the two task cards
          // GestureDetector(
          //     onTap: ()=> homeController.getStaffs()
          //         .then((value) => showModalBottomSheet(
          //       context: context,
          //       builder: (context) => BottomUpStaffsBar(),
          //        ),
          //     ),
          //     child: StaffCard()), // First task card
          const SizedBox(height: 16.0), // Space between the two task cards
          const AmountTextBox(), // Second task card
          const SizedBox(height: 32.0), // Space between the second task card and the button
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Align button to the right
            children: [
              SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.tipPage);
                    homeController.updateBillAmount();
                  }, // Button press action (currently does nothing)
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                    backgroundColor: Colors.purple, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners for the button
                    ),
                  ),
                  child: const Text(
                    "Pay ..", // Button text
                    style: TextStyle(
                      fontSize: 15, // Font size for the button text
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0), // Right margin for the button
            ],
          ),
        ],
      ),
    );
  }
}


class BottomUpBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -5), // Shadow above the bar
          ),
        ],
      ),
      child: Column(
        children: [
        const Text(
        "HOTELS",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),),
          const Divider(color: Colors.black12,),
          Obx(() {
            if (homeController.getHotelsResponse.value.status == Status.LOADING) {
              return const Center(child: CircularProgressIndicator());
            } else if (homeController.getHotelsResponse.value.status == Status.ERROR) {
              return Center(child: Text('Error: ${homeController.getHotelsResponse.value.error}'));
            } else if (homeController.getHotelsResponse.value.status == Status.COMPLETED) {
              var hotels = homeController.getHotelsResponse.value.data?.hotels ?? [];
              return ListView.builder(
                shrinkWrap: true,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        homeController.selectHotelID.value = hotels[index].id.toString();
                        homeController.selectHotel.value = hotels[index].name.toString();
                        homeController.getStaffs();
                        Get.back();
                        // Navigate to hotel details page or perform another action
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // Shadow beneath the card
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Image Section
                            Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.hotel,
                                  size: 20.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            // Text Section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hotels[index].name,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Hotel ID: ${hotels[index].id}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),

                                ],
                              ),
                            ),
                            // Arrow Icon
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center( child: Text('No data available'));
            }
          }),
        ],
      ),
    );
  }
}

//getStaffsResponse
class BottomUpStaffsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Container(
      height: 500,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -5), // Shadow above the bar
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        const Text(
        "STAFFS",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),),
          const Divider(color: Colors.black12,),
          Obx(() {
            if (homeController.getStaffsResponse.value.status == Status.LOADING) {
              return const Center(child: CircularProgressIndicator());
            } else if (homeController.getStaffsResponse.value.status == Status.ERROR) {
              return Center(child: Text('Error: ${homeController.getStaffsResponse.value.error}'));
            } else if (homeController.getStaffsResponse.value.status == Status.COMPLETED) {
              var staffs = homeController.getStaffsResponse.value.data?.staffs ?? [];
              return ListView.builder(
                shrinkWrap: true,
                itemCount: staffs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        homeController.selectStaffs.value = staffs[index].name;
                        Get.back();
                        // Navigate to hotel details page or perform another action
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // Shadow beneath the card
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Image Section
                            Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.hotel,
                                  size: 20.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            // Text Section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    staffs[index].name,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Hotel ID: ${staffs[index].id}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),

                                ],
                              ),
                            ),
                            // Arrow Icon
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          }),
        ],
      ),
    );
  }
}


class AmountTextBox extends StatelessWidget {
  final String hintText;

  const AmountTextBox({Key? key, this.hintText = "Enter amount"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Container(
      height:55,
      margin: const EdgeInsets.all(8),// Slightly increase height for better touch experience
      child: TextField(
        controller: controller.totalAmountController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(color: Colors.indigo.shade400),
          // hintText: hintText,
          // hintStyle: TextStyle(color: Colors.indigo.shade200), // Darker grey placeholder text
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0), // Adjust padding for better text alignment
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners for the text box
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5), // Light grey border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5), // Consistent border for enabled state
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey[500]!, width: 2.0), // Darker grey border when focused
          ),
          filled: true,
          fillColor: Colors.grey[100], // Light grey background color
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
        ],
        style: const TextStyle(
          color: Colors.black, // Text color
          fontWeight: FontWeight.bold,
          fontSize: 16.0, // Slightly larger font size for better readability
        ),
      ),
    );
  }
}
// Widget representing a single task card
class HotelCard extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0), // Padding inside the task card
      margin: const EdgeInsets.only(top: 10.0, bottom: 2, left: 6, right: 6), // Margin around the task card
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the task card
        borderRadius: BorderRadius.circular(16.0), // Rounded corners for the task card
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0), // Padding around the icon
            decoration: BoxDecoration(
              color: Colors.pink[100], // Background color for the icon container
              borderRadius: BorderRadius.circular(8.0), // Rounded corners for the icon container
            ),
            child: const Icon(
              Icons.hotel_outlined, // Icon displayed on the task card
              color: Colors.pink, // Icon color
              size: 20.0, // Icon size
            ),
          ),
          const SizedBox(width: 16.0), // Space between the icon and the text
          Obx(()=> Text(
              homeController.selectHotel.value, // Task title text
              style: const TextStyle(
                fontSize: 18.0, // Font size for the task title
                fontWeight: FontWeight.bold, // Bold font for emphasis
                color: Colors.black, // Text color
              ),
            ),
          ),
          const Spacer(), // Pushes the dropdown icon to the right
          const Icon(
            Icons.arrow_drop_down, // Dropdown arrow icon
            color: Colors.grey, // Icon color
          ),
        ],
      ),
    );
  }

}

class StaffCard extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  StaffCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0), // Padding inside the task card
      margin: const EdgeInsets.only(top: 10.0, bottom: 2, left: 6, right: 6), // Margin around the task card
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the task card
        borderRadius: BorderRadius.circular(16.0), // Rounded corners for the task card
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0), // Padding around the icon
            decoration: BoxDecoration(
              color: Colors.pink[100], // Background color for the icon container
              borderRadius: BorderRadius.circular(8.0), // Rounded corners for the icon container
            ),
            child: const Icon(
              Icons.hotel_outlined, // Icon displayed on the task card
              color: Colors.pink, // Icon color
              size: 20.0, // Icon size
            ),
          ),
          const SizedBox(width: 16.0), // Space between the icon and the text
          Obx(()=> Text(
              homeController.selectStaffs.value, // Task title text
              style: const TextStyle(
                fontSize: 18.0, // Font size for the task title
                fontWeight: FontWeight.bold, // Bold font for emphasis
                color: Colors.black, // Text color
              ),
            ),
          ),
          const Spacer(), // Pushes the dropdown icon to the right
          const Icon(
            Icons.arrow_drop_down, // Dropdown arrow icon
            color: Colors.grey, // Icon color
          ),
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:tip_and_feed_client/FEATURES/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<BottomNavBarController> {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: 'News',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.purple[100],
          unselectedItemColor: Colors.white,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }
}


import 'package:flutter/material.dart';

class AppIcons {
  // Common icons
  static const Icon person = Icon(Icons.person_2_rounded);
  static const Icon home = Icon(Icons.home);
  static const Icon search = Icon(Icons.search);
  static const Icon settings = Icon(Icons.settings);
  static const Icon notifications = Icon(Icons.notifications);

  // You can also customize icons with specific sizes or colors
  static Icon get customPersonIcon => Icon(Icons.person_2_rounded, size: 30, color: Colors.blue);
  static Icon get customHomeIcon => Icon(Icons.home, size: 24, color: Colors.green);

// Add more icons as needed
}

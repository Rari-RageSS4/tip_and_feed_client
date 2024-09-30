import 'package:flutter/material.dart';

class AppImages {

  // Path to the images directory
  static const String _logoPath = 'assets/logo/';

  static const String _iconsPath = 'assets/icons/';


  // Image assets
  static Image get appLogo => Image.asset(
    '${_logoPath}Untitled design (9).png',
    height: 55, // Adjust the height as needed
  );

  // Add more images as needed
  static Image get anotherImage => Image.asset(
    '${_logoPath}another_image.png',
    height: 50, // Adjust the height as needed
  );

  // If you have images in different folders, you can create separate paths

  static Image get iconImage => Image.asset(
    '${_iconsPath}icon_image.png',
    height: 40, // Adjust the height as needed
  );
}

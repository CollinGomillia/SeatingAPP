import 'package:flutter/material.dart';

class RestaurantModel {
  late int id;
  late String name;
  late List<String> category;
  late String description;
  late Image image;
  late Image imageLogo;
  double rating;


  RestaurantModel({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.imageLogo,
    required this.name,
    this.rating = -1,
});

  // Helper function to create scaled images
  static Image _scaleImage(Image image, double scale) {
    return Image(
      image: image.image,
      width: image.width! * scale,
      height: image.height! * scale,
      fit: BoxFit.cover,
    );
  }

}

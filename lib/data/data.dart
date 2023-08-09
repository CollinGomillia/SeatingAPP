import 'package:flutter/material.dart';
import 'package:seatingapp/models/restaurant_model.dart';

class RestaurantData {
  List<RestaurantModel> resList = [];

  RestaurantData() {
    resList.add(
      RestaurantModel(
        id: 0,
        name: 'Ruth Chris',
        category: ["American"],
        description:
        'Ruth Chris Steak House is a chain of over 100 steakhouses across the United States, Canada and Mexico.',
        image: Image.asset(
          "images/RuthChris.jpg",
          width: 20,
          height: 20,
        ),
        imageLogo: Image.asset(
          "images/RuthChrisLogo.png",
          scale: 0.5, // Adjust the scale value
        ),
        rating: 10.0, // Add the rating value here
      ),
    );
    resList.add(
      RestaurantModel(
        id: 1,
        name: 'Corndance Tavern',
        category: ["Bar"],
        description:
        'At Corndance, we believe in providing fine dining execution in a welcoming environment that creates the perfect setting to enjoy a great meal with friends and loved ones.',
        image: Image.asset(
          "images/Corndance.jpg",
          height: 20,
           width: 20, // Adjust the scale value
        ),
        imageLogo: Image.asset(
          "images/CorndanceLogo.png",
          scale: 0.2, // Adjust the scale value to make the image logo 50% of its original size
        ),
        rating: 10.0, // Add the rating value here (if available)
      ),
    );
    resList.add(
      RestaurantModel(
        id: 2,
        name: 'Bistro 933',
        category: ["Bistro"],
        description:
        'With over 30 years of culinary practice, our team provides a dynamic menu to create the ultimate dining experience',
        image: Image.asset(
          "images/Bistro.jpg",
          height: 20,
          width: 20,
        ),
        imageLogo: Image.asset(
          "images/BistroLogo.png",
          scale: 0.5, // Adjust the scale value
        ),
        rating: 10.0, // Add the rating value here
      ),
    );
  }
}

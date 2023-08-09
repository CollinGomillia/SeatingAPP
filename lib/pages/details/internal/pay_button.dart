import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/pages/booking/reservation.dart';

class BuyButton extends StatelessWidget {
  final String restaurantName;

  BuyButton(this.restaurantName);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.08,
        margin: EdgeInsets.symmetric(vertical: size.width * 0.05),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen(restaurantName: restaurantName),
              ),
            );
          },
          child: Text(
            'Buy Seat',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/pages/booking/internal/checkout_screen.dart'; // Import the checkout_screen.dart file


class PayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appPadding = 8.0; // this line to define the appPadding variable.

    return Expanded(
      flex: 13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                    Text(
                      "Available",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white // Use Colors.white here
                      ),
                    ),
                    Text(
                      "Reserved",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: primary
                      ),
                    ),
                    Text(
                      "Selected",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.08,
                width: size.width * 0.45,
                child: Center(
                  child: Text(
                    '\$10.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0)),
                  ),
                ),
                onPressed: () {
                  // Navigate to the CheckoutScreen when the Pay button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
                child: Container(
                  width: size.width * 0.45,
                  height: size.width * 0.08,
                  child: Center(
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
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

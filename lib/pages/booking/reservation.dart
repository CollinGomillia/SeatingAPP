import'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/pages/booking/internal/appbar.dart';
import 'package:seatingapp/pages/booking/internal/select_date.dart';
import 'package:seatingapp/pages/booking/internal/location_text.dart';
import 'package:seatingapp/pages/booking/internal/pay.dart';
import 'package:seatingapp/pages/booking/internal/seat_selector.dart';
import 'package:seatingapp/pages/booking/internal/time_select.dart';

class BookingScreen extends StatefulWidget {

  final String restaurantName;

  BookingScreen({required this.restaurantName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            //app bar
            CustomAppBar(widget.restaurantName), // Display the custom app bar with the restaurant name

            //date selector
            DateSelector(), // Include the date selector widget

            //Time selector
            TimeSelector(), // Include the time selector widget

            //Location
            LocationText(), // Display the location text widget

            //Seat selector
            SeatSelector(), // Include the seat selector widget

            //Pay button
            PayButton(), // Include the pay button widget
          ],
        ),
      ),
    );
  }
}

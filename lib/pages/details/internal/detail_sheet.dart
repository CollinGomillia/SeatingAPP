import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/models/restaurant_model.dart';
import 'package:seatingapp/pages/widget/format.dart';
import 'package:rubber/rubber.dart';
import 'package:seatingapp/pages/widget/star_rating.dart';

class DetailRubberSheet extends StatefulWidget {
  final RestaurantModel restaurant;
  final ScrollController rubberSheetScrollController;
  final RubberAnimationController rubberSheetAnimationController;

  DetailRubberSheet(
      this.restaurant,
      this.rubberSheetScrollController,
      this.rubberSheetAnimationController,
      );

  @override
  _DetailRubberSheetState createState() => _DetailRubberSheetState();
}

class _DetailRubberSheetState extends State<DetailRubberSheet> {
  // Widget to display a horizontal list of restaurant items
  Widget _resList(List resList) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 120.0,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: resList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: appPadding),
            child: Container(
              width: size.width / 6,
              child: Column(
                children: [
                  SizedBox(
                    height: 6.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: size.height / 2, end: 0),
      builder: (_, value, child) {
        // Apply translation to create the rubber sheet animation
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: RubberBottomSheet(
        scrollController: widget.rubberSheetScrollController,
        animationController: widget.rubberSheetAnimationController,
        lowerLayer: Container(
          color: Colors.transparent,
        ),
        upperLayer: Container(
          child: Column(
            children: [
              // Restaurant logo
              Container(
                child: Center(
                  child: Image(
                    image: widget.restaurant.imageLogo.image,
                    width: size.width / 2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(appPadding),
                    controller: widget.rubberSheetScrollController,
                    children: [
                      // Restaurant name
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // Restaurant category
                      GenresFormat(widget.restaurant.category, Colors.black),
                      SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // Restaurant name again
                      Text(
                        'Name : ' + widget.restaurant.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Function to show actors or cast (currently missing)

                      // Restaurant description
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        widget.restaurant.description,
                        style: TextStyle(
                          fontSize: 15,
                          color: black.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

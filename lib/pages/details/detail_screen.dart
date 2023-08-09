import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/models/restaurant_model.dart';
import 'package:seatingapp/pages/details/internal/background.dart';
import 'package:seatingapp/pages/details/internal/pay_button.dart';
import 'package:seatingapp/pages/details/internal/back_button.dart';
import 'package:seatingapp/pages/details/internal/detail_sheet.dart';
import 'package:rubber/rubber.dart';

class DetailScreen extends StatefulWidget {

  final RestaurantModel restaurant;

  final Size size;


  DetailScreen({required this.restaurant, required this.size});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {

  late RubberAnimationController rubberAnimationSheetController;
  late ScrollController rubberSheetScrollController;


  //animation when page starts
  @override
  void initState() {
    super.initState();
    rubberSheetScrollController = ScrollController();
    rubberAnimationSheetController = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: widget.size.height * 0.75),
        dismissable: false,
        upperBoundValue: AnimationControllerValue(percentage: 0.9),
        duration: Duration(milliseconds: 300),
        springDescription: SpringDescription.withDampingRatio(
          mass: 1,
          stiffness: Stiffness.LOW,
          ratio: DampingRatio.MEDIUM_BOUNCY,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Background  image
          Background(background: widget.restaurant.image),

          //Buttom sheet
          DetailRubberSheet(widget.restaurant, rubberSheetScrollController, rubberAnimationSheetController,),

          //Buy button
          BuyButton(widget.restaurant.name),

          //Back button
          CustomBackButton(context),
        ],
      ),
    );
  }
}
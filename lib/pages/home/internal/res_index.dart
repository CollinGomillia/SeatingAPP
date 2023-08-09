import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/data/data.dart';
import 'package:seatingapp/pages/details/detail_screen.dart';
import 'package:seatingapp/pages/widget/format.dart';
import 'package:seatingapp/pages/widget/star_rating.dart';


class RestaurantIndex extends StatefulWidget {
  late final int index;
  late final ScrollController restaurantScrollController;
  late final double restaurantItemWidth;

  RestaurantIndex(this.index, this.restaurantScrollController, this.restaurantItemWidth);

  @override
  _RestaurantIndexState createState() => _RestaurantIndexState();
}

class _RestaurantIndexState extends State<RestaurantIndex> {
  var restaurantData = RestaurantData();
  double maxRestaurantTranslate = 65;

  double _restaurantTranslate(double offset, double activeOffset) {
    double translate;
    if (widget.restaurantScrollController.offset + widget.restaurantItemWidth <=
        activeOffset) {
      translate = maxRestaurantTranslate;
    } else if (widget.restaurantScrollController.offset <= activeOffset) {
      translate = maxRestaurantTranslate -
          ((widget.restaurantScrollController.offset -
              (activeOffset - widget.restaurantItemWidth)) /
              widget.restaurantItemWidth *
              maxRestaurantTranslate);
    } else if (widget.restaurantScrollController.offset <
        activeOffset + widget.restaurantItemWidth) {
      translate = ((widget.restaurantScrollController.offset -
          (activeOffset - widget.restaurantItemWidth)) /
          widget.restaurantItemWidth *
          maxRestaurantTranslate) -
          maxRestaurantTranslate;
    } else {
      translate = maxRestaurantTranslate;
    }
    return translate;
  }

  double _restaurantDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (widget.restaurantScrollController.offset + widget.restaurantItemWidth <=
        activeOffset) {
      opacity = 0;
    } else if (widget.restaurantScrollController.offset <= activeOffset) {
      opacity = ((widget.restaurantScrollController.offset -
          (activeOffset - widget.restaurantItemWidth)) /
          widget.restaurantItemWidth *
          100);
    } else if (widget.restaurantScrollController.offset <
        activeOffset + widget.restaurantItemWidth) {
      opacity = 100 -
          (((widget.restaurantScrollController.offset -
              (activeOffset - widget.restaurantItemWidth)) /
              widget.restaurantItemWidth *
              100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: widget.restaurantScrollController,
            builder: (ctx, child) {
              double activeOffset = widget.index * widget.restaurantItemWidth;

              double translate = _restaurantTranslate(
                  widget.restaurantScrollController.offset, activeOffset);

              return SizedBox(
                height: translate,
              );
            },
          ),
          SizedBox(
            height: size.height * .008,
          ),
          Container(
            height: size.height * .15,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: size.width / 2.5,
                image: restaurantData.resList[widget.index].imageLogo.image,
              ),
            ),
          ),
          GenresFormat(
              restaurantData.resList[widget.index].category,
              white
          ),
          SizedBox(
            height: size.height * .005,
          ),
          StarRating(restaurantData.resList[widget.index].rating),
          SizedBox(
            height: size.height * .01,
          ),
          Container(
            width: size.width * .25,
            height: 1,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          InkWell(
            onTap: () =>
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder:(context, a1, a2) => DetailScreen(
                      restaurant: restaurantData.resList[widget.index],
                      size: size,
                    )
                )),
            child: Container(
              width: size.width * .25,
              height: size.height * .05,
              decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(child: Text('BUY TABLE', style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
              ),)),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder:(context, a1, a2) => DetailScreen(
                      restaurant: restaurantData.resList[widget.index],
                      size: size,
                    )
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image(
                image: restaurantData.resList[widget.index].image.image,
                width: size.width * 0.40,
                height: size.height * 0.25,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          AnimatedBuilder(
            animation: widget.restaurantScrollController,
            builder: (context, child) {
              double activeOffset = widget.index * widget.restaurantItemWidth;
              double opacity = _restaurantDescriptionOpacity(
                  widget.restaurantScrollController.offset, activeOffset);

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      restaurantData.resList[widget.index].name,
                      style: TextStyle(
                          color: white,
                          fontSize: size.width / 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

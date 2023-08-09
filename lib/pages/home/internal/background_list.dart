import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/data/data.dart';

class BackgroundListView extends StatefulWidget {

  final ScrollController backgroundScrollController;

  BackgroundListView(this.backgroundScrollController);

  @override
  _BackgroundListViewState createState() => _BackgroundListViewState();
}

class _BackgroundListViewState extends State<BackgroundListView> {

  var restaurantData = RestaurantData();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      controller: widget.backgroundScrollController,
      padding: EdgeInsets.zero,
      reverse: true,
      itemCount: restaurantData.resList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                left: -size.width / 3,
                right: -size.width / 3,
                child: Image(
                  image: restaurantData.resList[index].image.image,
                  fit: BoxFit.fill,

                ),
              ),
              Container(
                color: black.withOpacity(.4),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        // black.withOpacity(.9),
                        black.withOpacity(.3),
                        black.withOpacity(.95)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [ 0.5, 0.9]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

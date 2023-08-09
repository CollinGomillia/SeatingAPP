import 'package:flutter/material.dart';
import 'package:seatingapp/data/data.dart';
import 'package:seatingapp/pages/home/internal/res_index.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class RestaurantListView extends StatefulWidget {

  late final ScrollController restaurantScrollController;
  late final double restaurantItemWidth;

  RestaurantListView(this.restaurantScrollController,this.restaurantItemWidth);

  @override
  _restaurantListViewState createState() => _restaurantListViewState();
}

class _restaurantListViewState extends State<RestaurantListView> {
  var restaurantData = RestaurantData();


  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_,value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: Container(
        height: size.height * .8,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ScrollSnapList(
            listController: widget.restaurantScrollController,
            onItemFocus: (item) {
            },
            itemSize: widget.restaurantItemWidth,
            padding: EdgeInsets.zero,
            itemCount: restaurantData.resList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return RestaurantIndex(index, widget.restaurantScrollController, widget.restaurantItemWidth);
            },
          ),
        ),
      ),
    );
  }
}

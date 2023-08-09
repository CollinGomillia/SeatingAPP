import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';

class BuildChairs {
  static Widget selectedChair() {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        color: primary,
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget availableChair() {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        border: Border.all(color: white),
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget reservedChair() {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        color: white,
        shape: BoxShape.circle,
      ),
    );
  }
}
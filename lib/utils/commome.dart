import 'package:flutter/material.dart';

// this is for scroll
const ScrollPhysics defultScroll = BouncingScrollPhysics();

/// this is for labale Price

extension PriceLable on int {
  String get withPriceLable => '$this تومان';
}

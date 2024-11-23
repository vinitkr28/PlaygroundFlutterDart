import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class MobileInfo{

  MobileInfo(this.context);

  final BuildContext context;


  void get mobileScreenInfo{

    print('********** ## MediaQuery ## **********');
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    print('width:\t${MediaQuery.of(context).size.width}');
    print('height:\t${MediaQuery.of(context).size.height}');
    print('aspectRatio:\t${MediaQuery.of(context).size.aspectRatio}');
    print('flipped:\t${MediaQuery.of(context).size.flipped}');
    print('size.isEmpty:\t${MediaQuery.of(context).size.isEmpty}');
    print('size.hashCode:\t${MediaQuery.of(context).size.hashCode}');
    print('size.longestSide:\t${MediaQuery.of(context).size.longestSide}');
    print('size.shortestSide:\t${MediaQuery.of(context).size.shortestSide}');
    print('size.isFinite:\t${MediaQuery.of(context).size.isFinite}');
    print('size.toString():\t${MediaQuery.of(context).size.toString()}');

    var padding = MediaQuery.paddingOf(context);
    double newHeight = height - padding.top - padding.bottom;

    print('width: $width, height: $height, padding: $padding, newHeight: $newHeight');


    // First get the FlutterView.
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// Dimensions in physical pixels (px)
    Size size = view.physicalSize;
    double width1 = size.width;
    double height1 = size.height;

// Dimensions in logical pixels (dp)
    Size size1 = view.physicalSize / view.devicePixelRatio;
    double width2 = size.width;
    double height2 = size.height;

    print('width1: $width1, height1: $height1, width2: $width2, height2: $height2');


    var pixelRatio = window.devicePixelRatio;

    //Size in physical pixels
    var physicalScreenSize = window.physicalSize;
    var physicalWidth = physicalScreenSize.width;
    var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
    var logicalScreenSize = window.physicalSize / pixelRatio;
    var logicalWidth = logicalScreenSize.width;
    var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
    var padding2 = window.padding;

//Safe area paddings in logical pixels
    var paddingLeft = window.padding.left / window.devicePixelRatio;
    var paddingRight = window.padding.right / window.devicePixelRatio;
    var paddingTop = window.padding.top / window.devicePixelRatio;
    var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
    var safeWidth = logicalWidth - paddingLeft - paddingRight;
    var safeHeight = logicalHeight - paddingTop - paddingBottom;


    print('********** ## MediaQuery ## **********');

  }
}
import 'widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/lists.dart';

void randomNumbers() {

    rndNum1 = new Random();

    while (rndNameIndex == plantImgIndex) {
      rndNameIndex = rndNum1.nextInt(plantImages.length - 1);
    }

    while (rndNameIndex2 == plantImgIndex || rndNameIndex2 == rndNameIndex) {
      rndNameIndex2 = rndNum1.nextInt(plantImages.length - 1);
    }

}
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/lists.dart';

import 'functions.dart';



late Random rndImg; //late modifier allows use of non-nullable type for later assignment of value
late Random rndNum1; //late modifier allows use of non-nullable type for later assignment of value
late Random rndNum2; //late modifier allows use of non-nullable type for later assignment of value

int plantImgIndex = 0;
int plantNameIndex = 0;
int rndNameIndex = 0;
int rndNameIndex2 = 0;
String image_name ='';
int r = 0;

var randomOrderButtonWidgets = [];

//returns image asset of random plant image
Widget buildImage(BuildContext context, Random rndImg, bool a) {

  if(a) {
    int max = plantImages.length - 1;
    // rndImg = Random();
    int r = rndImg.nextInt(max);
    plantImgIndex = r;
    image_name = plantImages[r].toString();
  }

  return Image.asset(
    image_name,
    height: 350,
    fit: BoxFit
        .cover, //sets the child's size to be as small as possible while still covering the entire box of the parent
  );
}

//Title below image
Widget titleSection = Container(
  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 80, right: 80),
  child: Row(
    children: [
      Icon(
        Icons.water_rounded,
        color: Colors.blueGrey[500],
      ),
      Expanded(
        //fills container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Aquatic Plants of Florida',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Multiple Choice Quiz',
              style: TextStyle(
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.water_rounded,
        color: Colors.blueGrey[500],
      ),
    ],
  ),
);

//Text section below image title
Widget textSection = const Padding(
  padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
  child: Text(
    'Test your knowledge of Florida\'s aquatic plants with this quiz sourced from the Florida Department of Environmental Protection\'s plant identification resources. ',
    softWrap: true, //text lines will fill the column width
    textAlign: TextAlign.center,
  ),
);



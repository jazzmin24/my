import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle kbigTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.sp,
);

TextStyle kTempTextStyle =
    TextStyle(fontFamily: 'Spartan MB',
     fontSize: 30.sp,
    );


InputDecoration ktextfeildinputdecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 40.sp,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide.none),
);

TextStyle kButtonTextStyle = TextStyle(
  fontSize: 30.sp,
  fontFamily: 'Spartan MB',
);

TextStyle kConditionTextStyle = TextStyle(
  fontSize: 80.sp,
);

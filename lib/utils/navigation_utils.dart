import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_sample/screens/photo_details_page.dart';

void openPhotoDetailsPage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PhotoDetailsPage()));
}

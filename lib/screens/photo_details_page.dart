import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_sample/viewmodels/photo_viewmodel.dart';
import 'package:provider/provider.dart';

class PhotoDetailsPage extends StatelessWidget {
  const PhotoDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhotoViewModel photoViewModel = context.watch<PhotoViewModel>();
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(photoViewModel.photoModelSelected.author),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                color: Colors.amber,
                child: Center(
                    child: Text(
                  photoViewModel.photoModelSelected.author,
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ))),
            flex: 3,
          ),
          Expanded(
            flex: 7,
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: photoViewModel.photoModelSelected.downloadUrl,
                placeholder: (context, url) =>
                    const CupertinoActivityIndicator()),
          ),
        ],
      ),
    );
  }
}

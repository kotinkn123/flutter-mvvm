import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_sample/models/photo_model.dart';
import 'package:mvvm_sample/utils/app_loading.dart';
import 'package:mvvm_sample/utils/navigation_utils.dart';
import 'package:mvvm_sample/viewmodels/photo_viewmodel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Mvvm Sample"),
      ),
      body: Container(
        child: _uiUpdate(),
      ),
    );
  }

  _uiUpdate() {
    PhotoViewModel photoViewModel = context.watch<PhotoViewModel>();
    if (photoViewModel.isLoading) {
      return const AppLoading();
    } else {
      return ListView.builder(
          itemCount: photoViewModel.photoDataList.length,
          itemBuilder: (context, int index) {
            bool checked = false;
            PhotoModel photoModel = photoViewModel.photoDataList[index];
            if (photoViewModel.checkedList.contains(photoModel.id)) {
              checked = true;
            }
            return Card(
              margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: ListTile(
                contentPadding: EdgeInsets.all(4),
                tileColor: Colors.white,
                title: Text(photoModel.author),
                leading: CachedNetworkImage(
                  imageUrl: photoModel.downloadUrl,
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  photoViewModel.setPhotoSelected(photoModel);
                  openPhotoDetailsPage(context);
                },
              ),
            );
          });
    }
  }
}

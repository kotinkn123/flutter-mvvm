import 'package:flutter/cupertino.dart';
import 'package:mvvm_sample/models/photo_model.dart';
import 'package:mvvm_sample/repo/photo_model_repo.dart';
import 'package:mvvm_sample/utils/api_status.dart';

class PhotoViewModel extends ChangeNotifier {
  bool _isLoading = true;

  List<PhotoModel> _photoDataList = [];

  late PhotoModel _photoModelSelected;

  bool get isLoading => _isLoading;

  List<PhotoModel> get photoDataList => _photoDataList;

  PhotoModel get photoModelSelected => _photoModelSelected;

  //handling checkbox state
  List<String> checkedList = [];

  PhotoViewModel() {
    getPhotoData();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setPhotoData(List<PhotoModel> photoDataList) {
    _photoDataList = photoDataList;
  }

  setPhotoSelected(PhotoModel photoModel) {
    _photoModelSelected = photoModel;

    if (!checkedList.contains(_photoModelSelected.id)) {
      checkedList.add(_photoModelSelected.id);
    } else {
      checkedList.remove(_photoModelSelected.id);
    }
    notifyListeners();
  }

  getPhotoData() async {
    var response = await PhotoModelRepo.getPhotoData();
    if (response is Success) {
      setPhotoData(response.response as List<PhotoModel>);
    }
    setLoading(false);
  }
}

import 'package:http/http.dart' as http;
import 'package:mvvm_sample/models/photo_model.dart';
import 'package:mvvm_sample/utils/api_status.dart';
import 'package:mvvm_sample/utils/constants.dart';

class PhotoModelRepo {
  static Future<Object> getPhotoData() async {
    try {
      var response = await http.get(Uri.parse(Constants.PHOTO_URL));
      print("statcus code: ${response.statusCode}");
      if (response.statusCode == 200) {
        return Success(code: 200, response: photoModelFromJson(response.body));
      }
    } catch (e) {
      return Failure(code: 100, errorResponse: "Error fetching Data");
    }

    throw Exception("error");
  }
}

import 'dart:convert';

List<PhotoModel> photoModelFromJson(String str) =>
    List<PhotoModel>.from(json.decode(str).map((x) => PhotoModel.fromJson(x)));

String photoModelToJson(List<PhotoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoModel {
  PhotoModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}

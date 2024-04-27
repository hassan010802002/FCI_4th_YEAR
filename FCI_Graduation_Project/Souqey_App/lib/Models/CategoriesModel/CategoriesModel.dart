/// results : 10
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// data : [{"_id":"6439d61c0049ad0b52b90051","name":"Music","slug":"music","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg","createdAt":"2023-04-14T22:39:24.365Z","updatedAt":"2023-04-14T22:39:24.365Z"},{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg","createdAt":"2023-04-14T22:37:45.627Z","updatedAt":"2023-04-14T22:37:45.627Z"},{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg","createdAt":"2023-04-14T22:36:58.118Z","updatedAt":"2023-04-14T22:36:58.118Z"},{"_id":"6439d41c67d9aa4ca97064d5","name":"SuperMarket","slug":"supermarket","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511452254.png","createdAt":"2023-04-14T22:30:52.311Z","updatedAt":"2023-04-14T22:30:52.311Z"},{"_id":"6439d40367d9aa4ca97064cc","name":"Baby & Toys","slug":"baby-and-toys","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511427130.png","createdAt":"2023-04-14T22:30:27.166Z","updatedAt":"2023-04-14T22:30:27.166Z"},{"_id":"6439d3e067d9aa4ca97064c3","name":"Home","slug":"home","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511392672.png","createdAt":"2023-04-14T22:29:52.763Z","updatedAt":"2023-04-14T22:29:52.763Z"},{"_id":"6439d3c867d9aa4ca97064ba","name":"Books","slug":"books","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511368164.png","createdAt":"2023-04-14T22:29:28.200Z","updatedAt":"2023-04-14T22:29:28.200Z"},{"_id":"6439d30b67d9aa4ca97064b1","name":"Beauty & Health","slug":"beauty-and-health","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511179514.png","createdAt":"2023-04-14T22:26:19.587Z","updatedAt":"2023-04-14T22:26:19.587Z"},{"_id":"6439d2f467d9aa4ca97064a8","name":"Mobiles","slug":"mobiles","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511156008.png","createdAt":"2023-04-14T22:25:56.071Z","updatedAt":"2023-04-14T22:25:56.071Z"},{"_id":"6439d2d167d9aa4ca970649f","name":"Electronics","slug":"electronics","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511121316.png","createdAt":"2023-04-14T22:25:21.783Z","updatedAt":"2023-04-14T22:25:21.783Z"}]
library;

class CategoriesModel {
  CategoriesModel({
    num? results,
    Metadata? metadata,
    List<Data>? data,
  }) {
    _results = results;
    _metadata = metadata;
    _data = data;
  }

  CategoriesModel.fromJson(dynamic json) {
    _results = json['results'];
    _metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _results;
  Metadata? _metadata;
  List<Data>? _data;

  num? get results => _results;
  Metadata? get metadata => _metadata;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = _results;
    if (_metadata != null) {
      map['metadata'] = _metadata?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"
/// createdAt : "2023-04-14T22:39:24.365Z"
/// updatedAt : "2023-04-14T22:39:24.365Z"

class Data {
  Data({
    String? id,
    String? name,
    String? slug,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _name;
  String? _slug;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image'] = _image;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}

/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

class Metadata {
  Metadata({
    num? currentPage,
    num? numberOfPages,
    num? limit,
  }) {
    _currentPage = currentPage;
    _numberOfPages = numberOfPages;
    _limit = limit;
  }

  Metadata.fromJson(dynamic json) {
    _currentPage = json['currentPage'];
    _numberOfPages = json['numberOfPages'];
    _limit = json['limit'];
  }
  num? _currentPage;
  num? _numberOfPages;
  num? _limit;

  num? get currentPage => _currentPage;
  num? get numberOfPages => _numberOfPages;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = _currentPage;
    map['numberOfPages'] = _numberOfPages;
    map['limit'] = _limit;
    return map;
  }
}

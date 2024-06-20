class SubCategoriesModel {
  SubCategoriesModel({
    num? results,
    Metadata? metadata,
    List<Data>? data,
  }) {
    _results = results;
    _metadata = metadata;
    _data = data;
  }

  SubCategoriesModel.fromJson(dynamic json) {
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

class Data {
  Data({
    String? id,
    String? name,
    String? slug,
    String? category,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _category = category;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _category = json['category'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _name;
  String? _slug;
  String? _category;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get category => _category;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['category'] = _category;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}

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

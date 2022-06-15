import 'dart:ffi';

class Item{

  String _id;
  String _name;
  String _desc;
  String _longitude;
  String _latitude;
  String _postedBy;
  double _price;
  List<String> _images;

  Item(this._id, this._name, this._desc, this._longitude,this._latitude, this._postedBy,
      this._price,this._images);

  double get price => _price;

  String get postedBy => _postedBy;

  String get desc => _desc;

  String get name => _name;

  String get id => _id;

  String get latitude => _latitude;

  String get longitude => _longitude;

  List<String> get images => _images;

  set price(double value) {
    _price = value;
  }

  set postedBy(String value) {
    _postedBy = value;
  }

  set desc(String value) {
    _desc = value;
  }

  set name(String value) {
    _name = value;
  }

  set id(String value) {
    _id = value;
  }

  set latitude(String value) {
    _latitude = value;
  }

  set longitude(String value) {
    _longitude = value;
  }

  set images(List<String> value) {
    _images = value;
  }
}
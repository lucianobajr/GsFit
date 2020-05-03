import 'package:flutter/material.dart';

Color backgroundPeople = Color(0xffa54657);

class People {
  String _name;
  int _age;
  String _adress;
  bool _isFemale;
  String _imageUrl;
  int _id;

  People(this._name, this._age, this._adress, this._isFemale, this._imageUrl);

 

  People.map(dynamic obj) {
    this._name = obj["nome"];
    this._age = obj["idade"];
    this._adress = obj["Endereço"];
    this._isFemale = obj["Sexo"];
    this._imageUrl = obj["Imagem"];
    this._id = obj["id"];
  }

  String get name => _name;
  int get age => _age;
  String get adress => _adress;
  bool get isFemale => _isFemale;
  String get imageUrl => _imageUrl;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["nome"] = _name;
    map["idade"] = _age;
    map["Endereço"] = _adress;
    map["Sexo"] = _isFemale;
    map["Imagem"] = imageUrl;
    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  People.fromMap(Map<String, dynamic>map){
    this._name = map["nome"];
    this._age = map["idade"];
    this._adress = map["Endereço"];
    this._isFemale = map["Sexo"];
    this._imageUrl = map["Imagem"];
    this._id = map["id"];
  }
}

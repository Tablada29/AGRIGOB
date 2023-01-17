import 'package:flutter/material.dart';

class UserMode extends ChangeNotifier {


  String _id = '';

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String _humedad = '';
  String _map = '';
  String _faltante = '';
  String _nitrogeno = '';
  String _fosforo = '';
  String _potasio = '';
  String _fecha = '';
  String _ubi = '';
  String _optimo = '';
  String _actual = '';
  String _deficiente = '';


  String get humedad => _humedad;

  set humedad(String value) {
    _humedad = value;
  }

  String get map => _map;

  String get faltante => _faltante;

  String get nitrogeno => _nitrogeno;

  String get fosforo => _fosforo;

  String get potasio => _potasio;

  String get fecha => _fecha;

  String get ubi => _ubi;

  String get optimo => _optimo;

  String get actual => _actual;

  String get deficiente => _deficiente;

  set deficiente(String value) {
    _deficiente = value;
  }

  set actual(String value) {
    _actual = value;
  }

  set optimo(String value) {
    _optimo = value;
  }

  set ubi(String value) {
    _ubi = value;
  }

  set fecha(String value) {
    _fecha = value;
  }

  set potasio(String value) {
    _potasio = value;
  }

  set fosforo(String value) {
    _fosforo = value;
  }

  set nitrogeno(String value) {
    _nitrogeno = value;
  }

  set faltante(String value) {
    _faltante = value;
  }

  set map(String value) {
    _map = value;
  }
}
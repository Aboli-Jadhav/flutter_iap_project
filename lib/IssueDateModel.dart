import 'package:flutter/cupertino.dart';

class IssueDateModel {

    late int _index;

    int get index => _index;

  set index(int value) {
    _index = value;
  }

  late String _issuedate;
  late String _doc_ID;

    String get issuedate => _issuedate;

  set issuedate(String value) {
    _issuedate = value;
  }

    String get doc_ID => _doc_ID;

  set doc_ID(String value) {
    _doc_ID = value;
  }

    IssueDateModel(this._index, this._issuedate, this._doc_ID);
}
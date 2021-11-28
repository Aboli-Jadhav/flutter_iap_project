import 'package:flutter/cupertino.dart';

class View_supplier_data_model{

  String _snm;
  String _scode;
  String _stype;
  String _saddress;
  String _nabl_no;
  String _nabldate;
  String _nabldue;
  String _nabl_cert_link;
  String _lab_scope_link;
  String _lab_scope_file_nm;
  String _certificate_file_nm;
  List<String> _scopeList = [];
  List<String> _ContactNm_List = [];
  List<String> _ContactMail_List = [];
  List<String> _ContactMob_List = [];

  
  View_supplier_data_model(
      this._scode,this._nabl_no,this._saddress,this._snm,this._nabldue,
      this._nabldate,this._lab_scope_link,this._nabl_cert_link,this._lab_scope_file_nm,this._certificate_file_nm
      ,this._stype,
      this._scopeList,
      this._ContactMob_List,this._ContactNm_List,this._ContactMail_List
      );

  String get scode => _scode;

  set scode(String value) {
    _scode = value;
  }

  String get snm => _snm;

  set snm(String value) {
    _snm = value;
  }

  String get stype => _stype;

  set stype(String value) {
    _stype = value;
  }

  String get saddress => _saddress;

  set saddress(String value) {
    _saddress = value;
  }

  String get nabl_no => _nabl_no;

  set nabl_no(String value) {
    _nabl_no = value;
  }

  String get nabldate => _nabldate;

  set nabldate(String value) {
    _nabldate = value;
  }

  String get nabldue => _nabldue;

  set nabldue(String value) {
    _nabldue = value;
  }

  String get nabl_cert_link => _nabl_cert_link;

  set nabl_cert_link(String value) {
    _nabl_cert_link = value;
  }

  String get lab_scope_link => _lab_scope_link;

  set lab_scope_link(String value) {
    _lab_scope_link = value;
  }

  String get lab_scope_file_nm => _lab_scope_file_nm;

  set lab_scope_file_nm(String value) {
    _lab_scope_file_nm = value;
  }

  String get certificate_file_nm => _certificate_file_nm;

  set certificate_file_nm(String value) {
    _certificate_file_nm = value;
  }

  List<String> get scopeList => _scopeList;

  set scopelist(String value) {
    _scopeList.add(value);
  }

  List<String> get ContactMail => _ContactMail_List;

  set ContactMail_List(String value) {
    _ContactMail_List.add(value);
  }

  List<String> get ContactMob  => _ContactMob_List;

  set ContactMob_List(String value) {
    _ContactMob_List.add(value);
  }

  List<String> get ContactNm => _ContactNm_List;

  set ContactNm_List(String value) {
    _ContactNm_List.add(value);
  }




}

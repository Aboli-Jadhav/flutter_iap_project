import 'package:flutter/cupertino.dart';
class ScrapDataModel
{
  String _item_code;
  String _invoice_date;
  String _invoice_number;
  String _identification_number;
  String _gauge_type;
  String _gauge_make;
  String _manufacturer_serial_number ;
  String _maximum ;
  String _minimum ;
  String _nabl_accrediation_status ;
  String _nominal_size ;
  String _plant ;
  String _process_owner ;
  String _process_owner_mail_id ;
  String _reason ;
  String _remark ;
  String _responsible_person ;
  String _scrap_date ;
  String _scrap_note_id_no ;
  String _unit;
  String _gauge_location;
  String _gauge_life;
  String _gauge_cost;
  String _certificate_number;
  String _calibration_frequency;
  String _calibration_due_date;
  String _calibration_date;
  String _calibration_cost;
  String _calibration_agency_name;
  String _acceptance_criteria;

  String get item_code => _item_code;

  set item_code(String value) {
    _item_code = value;
  }

  String get invoice_date => _invoice_date;

  set invoice_date(String value) {
    _invoice_date = value;
  }

  String get invoice_number => _invoice_number;

  set invoice_number(String value) {
    _invoice_number = value;
  }

  String get acceptance_criteria => _acceptance_criteria;

  set acceptance_criteria(String value) {
    _acceptance_criteria = value;
  }

  String get calibration_agency_name => _calibration_agency_name;

  set calibration_agency_name(String value) {
    _calibration_agency_name = value;
  }

  String get calibration_cost => _calibration_cost;

  set calibration_cost(String value) {
    _calibration_cost = value;
  }

  String get calibration_date => _calibration_date;

  set calibration_date(String value) {
    _calibration_date = value;
  }

  String get calibration_due_date => _calibration_due_date;

  set calibration_due_date(String value) {
    _calibration_due_date = value;
  }

  String get calibration_frequency => _calibration_frequency;

  set calibration_frequency(String value) {
    _calibration_frequency = value;
  }

  String get certificate_number => _certificate_number;

  set certificate_number(String value) {
    _certificate_number = value;
  }

  String get gauge_cost => _gauge_cost;

  set gauge_cost(String value) {
    _gauge_cost = value;
  }

  String get gauge_life => _gauge_life;

  set gauge_life(String value) {
    _gauge_life = value;
  }

  String get gauge_location => _gauge_location;

  set gauge_location(String value) {
    _gauge_location = value;
  }

  String get unit => _unit;

  set unit(String value) {
    _unit = value;
  }

  String get scrap_note_id_no => _scrap_note_id_no;

  set scrap_note_id_no(String value) {
    _scrap_note_id_no = value;
  }

  String get scrap_date => _scrap_date;

  set scrap_date(String value) {
    _scrap_date = value;
  }

  String get responsible_person => _responsible_person;

  set responsible_person(String value) {
    _responsible_person = value;
  }

  String get remark => _remark;

  set remark(String value) {
    _remark = value;
  }

  String get reason => _reason;

  set reason(String value) {
    _reason = value;
  }

  String get process_owner_mail_id => _process_owner_mail_id;

  set process_owner_mail_id(String value) {
    _process_owner_mail_id = value;
  }

  String get process_owner => _process_owner;

  set process_owner(String value) {
    _process_owner = value;
  }

  String get plant => _plant;

  set plant(String value) {
    _plant = value;
  }

  String get nominal_size => _nominal_size;

  set nominal_size(String value) {
    _nominal_size = value;
  }

  String get nabl_accrediation_status => _nabl_accrediation_status;

  set nabl_accrediation_status(String value) {
    _nabl_accrediation_status = value;
  }

  String get minimum => _minimum;

  set minimum(String value) {
    _minimum = value;
  }

  String get maximum => _maximum;

  set maximum(String value) {
    _maximum = value;
  }

  String get manufacturer_serial_number => _manufacturer_serial_number;

  set manufacturer_serial_number(String value) {
    _manufacturer_serial_number = value;
  }

  String get gauge_make => _gauge_make;

  set gauge_make(String value) {
    _gauge_make = value;
  }

  String get gauge_type => _gauge_type;

  set gauge_type(String value) {
    _gauge_type = value;
  }

  String get identification_number => _identification_number;

  set identification_number(String value) {
    _identification_number = value;
  }

  ScrapDataModel(
      this._item_code,
      this._invoice_date,
      this._invoice_number,
      this._identification_number,
      this._gauge_type,
      this._gauge_make,
      this._manufacturer_serial_number,
      this._maximum,
      this._minimum,
      this._nabl_accrediation_status,
      this._nominal_size,
      this._plant,
      this._process_owner,
      this._process_owner_mail_id,
      this._reason,
      this._remark,
      this._responsible_person,
      this._scrap_date,
      this._scrap_note_id_no,
      this._unit,
      this._gauge_location,
      this._gauge_life,
      this._gauge_cost,
      this._certificate_number,
      this._calibration_frequency,
      this._calibration_due_date,
      this._calibration_date,
      this._calibration_cost,
      this._calibration_agency_name,
      this._acceptance_criteria);
}
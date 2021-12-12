
import "package:flutter/material.dart";
import 'package:flutter_iap_project/Admin/Calibrate%20Guages/calibrate_gauge.dart';
import 'package:flutter_iap_project/Admin/ShowGauge_WidgetEmpty.dart';
import 'package:flutter_iap_project/Admin/view_gauge_model.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/Add_To_Scrap.dart';
import 'showgauge_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ShowGauge extends StatefulWidget {
  // final String wppl_number;
  // final String manufacturer_number;
  // final String gauge_type;
  //const ShowGauge({Key? key, required this.wppl_number,required this.manufacturer_number,required this.gauge_type}) : super(key: key);
  final ViewGaugeModel model;
  const ShowGauge({Key? key,required this.model}) : super(key: key);



  @override
  _ShowGaugeState createState() => _ShowGaugeState();
}

class _ShowGaugeState extends State<ShowGauge> {

  TextEditingController calibration_agency_name =TextEditingController();
  TextEditingController calibration_cost       =TextEditingController();
  TextEditingController calibration_date        =TextEditingController();
  TextEditingController calibration_due_date   =TextEditingController();
  TextEditingController calibration_frequency   =TextEditingController();
  TextEditingController certificate_number      =TextEditingController();
  TextEditingController gauge_cost             =TextEditingController();
  TextEditingController gauge_life              =TextEditingController();
  TextEditingController gauge_make              =TextEditingController();
  TextEditingController gauge_manufacturer_id_number =TextEditingController();
  TextEditingController item_code =TextEditingController();
  TextEditingController maximum =TextEditingController();
  TextEditingController minimum =TextEditingController();
  TextEditingController nabl_accrediation_status =TextEditingController();
  TextEditingController nominal_size =TextEditingController();
  TextEditingController physical_location =TextEditingController();
  TextEditingController plant =TextEditingController();
  TextEditingController process_owner =TextEditingController();
  TextEditingController process_owner_mail_id =TextEditingController();
  TextEditingController remark =TextEditingController();
  TextEditingController unit =TextEditingController();
  TextEditingController wppl_gauge_id_number = TextEditingController();
  TextEditingController invoice_date = TextEditingController();
  TextEditingController invoice_number = TextEditingController();
  TextEditingController gauge_type = TextEditingController();
  TextEditingController acceptance_criteria = TextEditingController();

  Color lred=Color(0xffFBEBEB);
  Color backred=Color(0xffDF3F3F);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showdata();
    //submittoFirestore();
  }

  void showdata(){
     calibration_agency_name.text =  widget.model.calibration_agency_name;
     calibration_cost.text        =widget.model.calibration_cost;
     calibration_date.text        =widget.model.calibration_date;
     calibration_due_date.text    =widget.model.calibration_due_date;
     calibration_frequency.text   =widget.model.calibration_frequency;
     certificate_number.text      =widget.model.certificate_number;
     gauge_cost.text              =widget.model.gauge_cost;
     gauge_life.text              =widget.model.gauge_life;
     gauge_make.text              =widget.model.gauge_make;
     gauge_manufacturer_id_number.text =widget.model.manufacturer_serial_number;
     item_code.text                     =widget.model.item_code;
     maximum.text                        =widget.model.maximum;
     minimum.text                        =widget.model.minimum;
     nabl_accrediation_status.text = widget.model.nabl_accrediation_status;
     nominal_size.text            =widget.model.nominal_size;
     physical_location.text       =widget.model.gauge_location;
     plant.text                   =widget.model.plant;
     process_owner.text           = widget.model.process_owner;
     process_owner_mail_id.text   = widget.model.process_owner_mail_id;
     remark.text                  = widget.model.remark;
     unit.text                    = widget.model.unit;
     wppl_gauge_id_number.text    = widget.model.identification_number;
     //TODO: Add acceptace_criteria, invoice_date, invoice_number, gauge_type
    invoice_date.text = widget.model.invoice_date;
    invoice_number.text = widget.model.invoice_number;
    gauge_type.text = widget.model.gauge_type;
    acceptance_criteria.text = widget.model.acceptance_criteria;
     // setState(() {
     //
     // });
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: lred,
      appBar: AppBar(
        backgroundColor: backred,
        title: Text("Gauge Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'WPPL Gauge Id Number',data: wppl_gauge_id_number)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Agency Name',data: calibration_agency_name)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Cost (INR)',data: calibration_cost)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Date (DD.MM.YYYY)',data: calibration_date)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Due Date (DD.MM.YYYY)',data: calibration_due_date)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Frequency (In Days)',data: calibration_frequency)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Certificate Number',data: certificate_number)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge Manufacturing Cost (INR)',data: gauge_cost)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge Life (In Months)',data: gauge_life)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge Make',data: gauge_make)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge Manufacturer Id',data: gauge_manufacturer_id_number)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Unit',data: unit)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Maximum',data: maximum)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Minimum',data: minimum)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'NABL Accrediation Status',data: nabl_accrediation_status)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Nominal Size',data: nominal_size)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Location',data: physical_location)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Remark',data: remark)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Process Owner',data: process_owner)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Process Owner Mail Id',data: process_owner_mail_id)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Plant',data: plant)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Item Code',data: item_code)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Invoice Date',data: invoice_date,)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Invoice Number',data: invoice_number,)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge type',data: gauge_type)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Acceptance Criteria',data: acceptance_criteria)
                ),
                Expanded(
                    child: ShowGauge_WidgetEmpty(),
                ),
                Expanded(
                    child: ShowGauge_WidgetEmpty()
                ),
              ],
            ),
            SizedBox(height: 30,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //       child: Text("Calibrate Gauge"),
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.red,
            //       ),
            //       onPressed: () {
            //         Navigator.push(context,MaterialPageRoute(builder: (context) => Calibrate_Gauge(wppl_number: widget.model.identification_number)),);
            //       },
            //     ),
            //     const SizedBox(width: 50,),
            //     ElevatedButton(
            //       child: Text("Scrap Gauge"),
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.red,
            //       ),
            //       onPressed: () {
            //         //Navigator.push(context,MaterialPageRoute(builder: (context) => view_master_gau()),);
            //         Navigator.push(context,MaterialPageRoute(builder: (context) => AddToScrap(gauge_name: [],identification_number: widget.model.identification_number,manufacturer_number: widget.model.manufacturer_serial_number,nominal_size: widget.model.nominal_size,gauge_name_from_showgauge: widget.model.gauge_type,)),);
            //
            //       },
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_iap_project/master_admin/showgauge_widget_masteradmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../ShowGauge_WidgetEmpty.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCalibrationHistory extends StatefulWidget {
  final String wppl_number;
  const AddCalibrationHistory({Key? key,required this.wppl_number}) : super(key: key);

  @override
  _AddCalibrationHistoryState createState() => _AddCalibrationHistoryState();
}

//Global Variables
FirebaseFirestore firestore = FirebaseFirestore.instance;
String uid='';


class _AddCalibrationHistoryState extends State<AddCalibrationHistory> {

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
    //showdata();
    calibrate_gauge_data();

  }

  // void showdata(){
  //   calibration_agency_name.text =  widget.model.calibration_agency_name;
  //   calibration_cost.text        =widget.model.calibration_cost;
  //   calibration_date.text        =widget.model.calibration_date;
  //   calibration_due_date.text    =widget.model.calibration_due_date;
  //   calibration_frequency.text   =widget.model.calibration_frequency;
  //   certificate_number.text      =widget.model.certificate_number;
  //   gauge_cost.text              =widget.model.gauge_cost;
  //   gauge_life.text              =widget.model.gauge_life;
  //   gauge_make.text              =widget.model.gauge_make;
  //   gauge_manufacturer_id_number.text =widget.model.manufacturer_serial_number;
  //   item_code.text                     =widget.model.item_code;
  //   maximum.text                        =widget.model.maximum;
  //   minimum.text                        =widget.model.minimum;
  //   nabl_accrediation_status.text = widget.model.nabl_accrediation_status;
  //   nominal_size.text            =widget.model.nominal_size;
  //   physical_location.text       =widget.model.gauge_location;
  //   plant.text                   =widget.model.plant;
  //   process_owner.text           = widget.model.process_owner;
  //   process_owner_mail_id.text   = widget.model.process_owner_mail_id;
  //   remark.text                  = widget.model.remark;
  //   unit.text                    = widget.model.unit;
  //   wppl_gauge_id_number.text    = widget.model.identification_number;
  //   //TODO: Add acceptace_criteria, invoice_date, invoice_number, gauge_type
  //   invoice_date.text = widget.model.invoice_date;
  //   invoice_number.text = widget.model.invoice_number;
  //   gauge_type.text = widget.model.gauge_type;
  //   acceptance_criteria.text = widget.model.acceptance_criteria;
  //   // setState(() {
  //   //
  //   // });
  // }
  void calibrate_gauge_data()async{

    await firestore.collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .where("identification_number",isEqualTo: widget.wppl_number)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if(querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          //print(doc["first_name"]);
          uid = doc.id.toString();

            calibration_agency_name.text =  '';
            calibration_cost.text        = '';
            calibration_date.text        = '';
            calibration_due_date.text    = '';
            calibration_frequency.text   = '';
            certificate_number.text      = '';
            gauge_cost.text              = doc['gauge_cost'];
            gauge_life.text              = doc['gauge_life'];
            gauge_make.text              = doc['gauge_make'];
            gauge_manufacturer_id_number.text = doc['manufacturer_serial_number'];
            item_code.text                     = doc['item_code'];
            maximum.text                        = doc['maximum'];
            minimum.text                        = doc['minimum'];
            nabl_accrediation_status.text = doc['nabl_accrediation_status'];
            nominal_size.text            = doc['nominal_size'];
            physical_location.text       = doc['gauge_location'];
            plant.text                   = doc['plant'];
            process_owner.text           = doc['process_owner'];
            process_owner_mail_id.text   = doc['process_owner_mail_id'];
            remark.text                  = doc['remark'];
            unit.text                    = doc['unit'];
            wppl_gauge_id_number.text    = doc['identification_number'];
            //TODO: Add acceptace_criteria, invoice_date, invoice_number, gauge_type
            invoice_date.text            = doc['invoice_date'];
            invoice_number.text          = doc['invoice_number'];
            gauge_type.text              = doc['gauge_type'];
            acceptance_criteria.text     = doc['acceptance_criteria'];
            setState(() {

            });

        });
      }else{
        Fluttertoast.showToast(
            msg: "No such Gauge is exists",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }


  void addCalibratedDataToHistory() async{

    await firestore.collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .doc(uid)
        .collection("History")
        .add({
      "gauge_type":gauge_type.text,
      "identification_number": wppl_gauge_id_number.text,
      "manufacturer_serial_number":gauge_manufacturer_id_number.text,
      "nominal_size":nominal_size.text,
      "minimum":minimum.text,
      "maximum":maximum.text,
      "calibration_agency_name":calibration_agency_name.text,
      "calibration_frequency":calibration_frequency.text,
      "calibration_cost": calibration_cost.text,
      "remark": remark.text,
      "gauge_location": physical_location.text,
      "calibration_date":calibration_date.text,
      "calibration_due_date":calibration_due_date.text,
      "item_code": item_code.text,
      'gauge_make':gauge_make.text,
      'gauge_cost':gauge_cost.text,
      'gauge_life':gauge_life.text,
      'invoice_number':invoice_number.text,
      'invoice_date':invoice_date.text,
      'certificate_number':certificate_number.text,
      'nabl_accrediation_status':nabl_accrediation_status.text,
      'process_owner':process_owner.text,
      'process_owner_mail_id':process_owner_mail_id.text,
      'unit':unit.text, //fetch this
      'plant':plant.text,
      'acceptance_criteria': acceptance_criteria.text


    })
        .then((value) {
      Fluttertoast.showToast(
          msg: "History Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((onError){
      Fluttertoast.showToast(
          msg: "Operation Failed, Try Again!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lred,
      appBar: AppBar(
        backgroundColor: backred,
        title: Text("Add Calibration History"),
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
                    child: ShowGauge_Widget_MasterAdmin(heading: 'WPPL Gauge Id Number',data: wppl_gauge_id_number)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Calibration Agency Name',data: calibration_agency_name)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Calibration Cost (INR)',data: calibration_cost)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Calibration Date (DD.MM.YYYY)',data: calibration_date)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Calibration Due Date (DD.MM.YYYY)',data: calibration_due_date)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Calibration Frequency (In Days)',data: calibration_frequency)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Certificate Number',data: certificate_number)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Gauge Manufacturing Cost (INR)',data: gauge_cost)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Gauge Life (In Months)',data: gauge_life)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Gauge Make',data: gauge_make)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Gauge Manufacturer Id',data: gauge_manufacturer_id_number)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Unit',data: unit)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Maximum',data: maximum)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Minimum',data: minimum)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'NABL Accrediation Status',data: nabl_accrediation_status)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Nominal Size',data: nominal_size)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Location',data: physical_location)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Remark',data: remark)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Process Owner',data: process_owner)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Process Owner Mail Id',data: process_owner_mail_id)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Plant',data: plant)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Item Code',data: item_code)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Invoice Date',data: invoice_date,)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Invoice Number',data: invoice_number,)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Gauge type',data: gauge_type)
                ),
                Expanded(
                    child: ShowGauge_Widget_MasterAdmin(heading: 'Acceptance Criteria',data: acceptance_criteria)
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("Add Calibration History"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => A),);
                    print('Calibration History added');

                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



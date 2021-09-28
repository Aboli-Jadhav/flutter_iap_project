
import "package:flutter/material.dart";
import 'package:flutter_iap_project/Admin/ShowGauge_WidgetEmpty.dart';
import 'ShowGauge_Widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ShowGauge extends StatefulWidget {
  final String wppl_number;
  final String manufacturer_number;
  final String gauge_type;
  const ShowGauge({Key? key, required this.wppl_number,required this.manufacturer_number,required this.gauge_type}) : super(key: key);

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
  TextEditingController empty = TextEditingController();

  Color lred=Color(0xffFBEBEB);
  Color backred=Color(0xffDF3F3F);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    submittoFirestore();
  }

  void submittoFirestore() async{
    var gauge_name=widget.gauge_type;
    var collection_name="all "+gauge_name;
    var wpp_number = widget.wppl_number;
    var manufacturer_number = widget.manufacturer_number;
    var final_number = wpp_number+"_"+manufacturer_number;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Gauge Types")
        .collection("All Gauges")
        .doc(gauge_name)
        .collection(collection_name)
        .doc(final_number)
        .get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

        calibration_agency_name.text = data['CALIBRATION AGENCY NAME'];
        calibration_cost.text        = data['CALIBRATION COST'];
        calibration_date.text        = data['CALIBRATION DATE'];
        calibration_due_date.text    = data['CALIBRATION DUE DATE'];
        calibration_frequency.text   = data['CALIBRATION FREQUENCY'];
        certificate_number.text      = data['CERTIFICATE NUMBER'];
        gauge_cost.text              = data['GAUGE COST'];
        gauge_life.text              = data['GAUGE LIFE'];
        gauge_make.text              = data['GAUGE MAKE'];
        gauge_manufacturer_id_number.text= data['GAUGE MANUFACTURER ID NUMBER'];
        item_code.text               = data['ITEM CODE'];
        maximum.text                 = data['MAXIMUM'];
        minimum.text                 = data['MINIMUM'];
        nabl_accrediation_status.text     = data['NABL ACCREDIATION STATUS'];
        nominal_size.text            = data['NOMINAL SIZE'];
        physical_location.text       = data['PHYSICAL LOCATION'];
        plant.text                   = data['PLANT'];
        process_owner.text           = data['PROCESS OWNER'];
        process_owner_mail_id.text   = data['PROCESS OWNER MAIL ID'];
        remark.text                  = data['REMARK'];
        unit.text                    = data['UNIT'];
        wppl_gauge_id_number.text   = data['WPPL GAUGE ID NUMBER'];
        empty.text = "null";



      }else {
        print('Document does not exist on the database');
      }
    });





  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: lred,
      appBar: AppBar(
        backgroundColor: backred,
        title: Text("Gauge details"),
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
                    child: ShowGauge_Widget(heading: 'WPPL gauge id number',data: wppl_gauge_id_number)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Agency name',data: calibration_agency_name)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration cost',data: calibration_cost)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration date',data: calibration_date)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Due Date',data: calibration_due_date)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Calibration Frequency',data: calibration_frequency)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Certificate number',data: certificate_number)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge cost',data: gauge_cost)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge life',data: gauge_life)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge make',data: gauge_make)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Gauge manufacturer id',data: gauge_manufacturer_id_number)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Item code',data: item_code)
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
                    child: ShowGauge_Widget(heading: 'NABL Accrediation status',data: nabl_accrediation_status)
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
                    child: ShowGauge_Widget(heading: 'Plant',data: plant)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Process Owner',data: process_owner)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Process Owner mail id',data: process_owner_mail_id)
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: ShowGauge_Widget(heading: 'Remark',data: remark)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Unit',data: unit)
                ),
                Expanded(
                    child: ShowGauge_WidgetEmpty()
                ),
                Expanded(
                    child: ShowGauge_WidgetEmpty()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

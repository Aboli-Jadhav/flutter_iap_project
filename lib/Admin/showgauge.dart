
import "package:flutter/material.dart";
import 'package:flutter_iap_project/Admin/ShowGauge_WidgetEmpty.dart';
import 'showgauge_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ShowGauge extends StatefulWidget {
  // final String wppl_number;
  // final String manufacturer_number;
  // final String gauge_type;
  //const ShowGauge({Key? key, required this.wppl_number,required this.manufacturer_number,required this.gauge_type}) : super(key: key);
  const ShowGauge({Key? key}) : super(key: key);



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
    //submittoFirestore();
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
                    child: ShowGauge_Widget(heading: 'Unit',data: item_code)
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
                    child: ShowGauge_Widget(heading: 'Remark',data: plant)
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
                    child: ShowGauge_Widget(heading: 'Plant',data: remark)
                ),
                Expanded(
                    child: ShowGauge_Widget(heading: 'Item Code',data: unit)
                ),
                Expanded(
                    child: ShowGauge_WidgetEmpty()
                ),
                Expanded(
                    child: ShowGauge_WidgetEmpty()
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("Calibrate Gauge"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => view_master_gau()),);

                  },
                ),
                const SizedBox(width: 50,),
                ElevatedButton(
                  child: Text("Scrap Gauge"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => view_master_gau()),);

                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

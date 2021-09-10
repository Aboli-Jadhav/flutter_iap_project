import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  @override
  DropDownState createState() => DropDownState();
}

class Gauge {
  int id;
  String name;

  Gauge(this.id, this.name);

  static List<Gauge> getGauges() {
    return <Gauge>[
      Gauge(1, 'Gauge-1'),
      Gauge(2, 'Gauge-2'),
      Gauge(3, 'Gauge-3'),
      Gauge(4, 'Gauge-4'),
      Gauge(5, 'Gauge-5'),
    ];
  }
}

class DropDownState extends State<DropDown> {

  List<Gauge> _companies = Gauge.getGauges();
  late List<DropdownMenuItem<Gauge>> _dropdownMenuItems;
  late Gauge ?_selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<Gauge>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Gauge>> items = [];
    for (Gauge company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  void onChangeDropdownItem(Gauge ?selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 4.0,
            ),
            Container(
              width: 300,
              height: 47,
              padding: EdgeInsets.fromLTRB(20,10,10,10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _selectedCompany ,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
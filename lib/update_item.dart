import 'package:flutter/material.dart';



class update_item extends StatefulWidget {

  @override
  _update_itemState createState() => _update_itemState();
}

class _update_itemState extends State<update_item> {
  final List<String> names = <String>['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7', 'Item 8'];
  late String newName;
  late String addName;
  TextEditingController nctrl = TextEditingController();
  TextEditingController nctrl2 = TextEditingController();


  void addItemToList(){
    setState(() {
      addName = nctrl2.text;
      if(addName!="")
      names.insert(0,addName);
      nctrl2.clear();

    });
  }
  _changePetName() {
    newName = nctrl.text;
    Navigator.pop(context, newName);
    return newName;
  }

  Future<String?> _showDialog(String name) async {
    nctrl.text = name;
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          backgroundColor: Colors.white70,
          title: Text(
            "New Description",
          ),
          content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: nctrl,
                    onChanged: (e) {
                    },
                  ),
                ],
              )),
          actions: <Widget>[
            //
            // FlatButton(
            //   color: Colors.red,
            //   child: Text("Close"),
            //   onPressed: () {
            //     Navigator.of(context).pop(nctrl.text);
            //   },
            // ),
            // SizedBox(width: 60,),
            FlatButton(
              color: Colors.red,
              child: Text(
                "Submit",
              ),
              onPressed: () {
                var updateName = _changePetName();
                return updateName;
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 600,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: nctrl2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Item Name',
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Add'),
              onPressed: () {
                addItemToList();
              },
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: 300,
              child: ListView.builder(

                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  var pet = names[index];
                  return Column(
                    children: [
                      ListTile(

                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red, width: 0.5),
                            borderRadius: BorderRadius.circular(10),

                        ),
                        key: ValueKey(index),
                        enabled: true,
                        onTap: () async {
                          var rename = await _showDialog(names[index]);
                          if (rename != null) {
                            names[index] = rename;
                            setState(() {});
                          }
                        },
                        title: Text(names[index]),
                      ),
                      SizedBox(height: 20,)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}


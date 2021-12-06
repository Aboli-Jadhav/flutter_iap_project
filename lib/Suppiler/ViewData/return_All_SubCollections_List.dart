import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class return_all_subCollections_List
{
  final supplier_code,stype;
  return_all_subCollections_List( this.supplier_code,this.stype);

  List<String> fetched_nm = [];
  List<String> fetched_scope = [];
  List<String> fetched_emails= [];
  List<String> fetched_phones = [];


  Future<String> returnIDOfDOc()
  async {
    String ret="";
    await FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier").collection("all_")
        .get().then((value)
    {
      for(var ele in value.docs)
      {
        if(ele.data()['agencyCode']==this.supplier_code.trim()
            &&  ele.data()['agencytype']==this.stype.trim()
        )
        {
          ret=ele.id;
          return ret;
        }
        else
        {
          print("Record not present.");
        }
      }
    });
    print(ret);
    return ret;
  }


  Future<List<String>> getEmails()  async{
    String RecId= await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Emails").get().then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          fetched_emails.add(ele.value);
          print(ele.value);
        });
      });

    }
    );
    print(fetched_emails);
    return fetched_emails;
  }

  Future<List<String>> getNames()  async {
    String RecId= await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Name").get().then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          fetched_nm.add(ele.value);
          print(ele.value);
        });
      });

    }
    );
    print(fetched_nm);
    return fetched_nm;
  }

  Future<List<String>> getPhones()  async {
    String RecId= await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Phone").get().then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          fetched_phones.add(ele.value);
          print(ele.value);
        });
      });

    }
    );
    print(fetched_phones);
    return fetched_phones;
  }

  Future<List<String>> getScope()  async {
    String RecId= await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Scope").get().then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          fetched_scope.add(ele.value);
          print(ele.value);
        });
      });

    }
    );
    print(fetched_scope);
    return fetched_scope;
  }


}
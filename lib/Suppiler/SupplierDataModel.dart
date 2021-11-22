import 'package:flutter/cupertino.dart';

class SupplierDataModel
{
       TextEditingController snm=TextEditingController();
       TextEditingController scode=TextEditingController();
       TextEditingController stype=TextEditingController();
       TextEditingController saddress=TextEditingController();
       TextEditingController scontactnm=TextEditingController();
       TextEditingController scontactMail=TextEditingController();
       TextEditingController scontactMob=TextEditingController();
       TextEditingController nablNo=TextEditingController();
       TextEditingController nabldate=TextEditingController();
       TextEditingController nabldue=TextEditingController();
       TextEditingController nabl_cert_link=TextEditingController();
       TextEditingController lab_scope_link=TextEditingController();
       TextEditingController lab_scope_file_nm=TextEditingController();
       TextEditingController certificate_file_nm=TextEditingController();


      SupplierDataModel.toJson(Map<String,dynamic>? demo)
      {
            snm.text=demo!['agencyName'].toString();
            stype.text=demo['agencytype'].toString();
            saddress.text=demo['agencyAddress'].toString();
            scode.text=demo['agencyCode'].toString();
            scontactnm.text=demo['contact_person_nm'].toString();
            scontactMail.text=demo['contact_person_mailid'].toString();
            scontactMob.text=demo['contact_person_mob'].toString();
            nablNo.text=demo['NABL_certificate_No'].toString();
            nabldate.text=demo['NABL_Cert_Date'].toString();
            nabldue.text=demo['NABL_Cert_Due_Date'].toString();
            nabl_cert_link.text=demo['NABL_Certificate_Download_Link'].toString();
            lab_scope_link.text=demo['NABL_Lab_Scope_Download_Link'].toString();
            certificate_file_nm.text=demo['NABL_Certificate_FileName'].toString();
            lab_scope_file_nm.text=demo['NABL_Lab_Scope_FileName'].toString();

      }
}
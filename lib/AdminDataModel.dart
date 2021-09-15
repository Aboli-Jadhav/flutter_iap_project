import 'dart:core';
import 'package:flutter/material.dart';

class AdminDataModel
{
    late String admin_nm,location,email,phone;


    AdminDataModel(String admin_nm,String location,String email,String phone)
    {
        this.email=email;
        this.phone=phone;
        this.admin_nm=admin_nm;
        this.location=location;
    }

    void setAdminName(String nm)
    {
      admin_nm=nm;
    }

    String getAdminName()
    {
      return admin_nm;
    }

    void setAdmin_Phone(String phone)
    {
      this.phone=phone;
    }

    String getAdmin_Phone()
    {
      return phone;
    }

    void setAdmin_Location(String location)
    {
      this.location=location;
    }

    String getAdmin_Location()
    {
        return location;
    }

    void setAdmin_Email(String email)
    {
        this.email=email;
    }

    String getAdmin_Email()
    {
        return email;
    }

}
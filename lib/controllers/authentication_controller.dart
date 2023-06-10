



import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_flutter_form_mvc_architecture/models/register_model.dart';

class AuthenticationController extends ControllerMVC{
  var scaffoldKey = GlobalKey<ScaffoldState>(); //screen
  var formKey = GlobalKey<FormState>();

  bool showPassword = false;
  
  RegisterModel registerModel = RegisterModel();  //forms

  AuthenticationController(){
      registerModel = RegisterModel();
  }


  register(){
    if (formKey.currentState!.validate()){
      formKey.currentState!.save();
      // scaffoldKey.currentState!.showSnackBar(
      //   SnackBar(content: Text("All Fields are correct ${registerModel.name}"))

      // );
    }

  }
}




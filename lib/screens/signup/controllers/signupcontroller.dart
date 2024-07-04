import 'dart:developer';

import 'package:apitrial/screens/signup/blocs/signupbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController{
  static SignUp(String email,String password,String username,String phonenumber,BuildContext context){
    if(email=="" ||password=="" ||phonenumber=="" ||username=="" ){
      return log("fields r empty");
    }
    else{
      context.read<SignUpBloc>().signUp(email, password, username, phonenumber);
      log("success");
    }
  }
}
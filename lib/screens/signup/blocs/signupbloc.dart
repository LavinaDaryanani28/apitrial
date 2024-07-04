import 'dart:convert';
// import 'dart:math';
import 'dart:developer';
import 'package:apitrial/screens/signup/blocs/SignUpEvents.dart';
import 'package:apitrial/screens/signup/blocs/signupstates.dart';
import 'package:apitrial/screens/signup/models/signupmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../utils/BaseUrls.dart';

class SignUpBloc extends Bloc<SignUpEvents,SignUpStates> {
  SignUpBloc() : super(SignUpInitialStates());

  signUp(String email, String password, String username,
      String phonenumber) async {
    emit(SignUpLoadingStates());
    final response = await http.post(Uri.parse(BaseUrls.signup),
      headers: {'Content-Type':'application/json'},
      body: jsonEncode({
        "email":email,
        "password":password,
        "username":username,
        "phonenumber":phonenumber
      }));
    if(response.statusCode==200){
      Map<String, dynamic> responsedata = jsonDecode(response.body);
      log(responsedata.toString());
      SignUpModel signUpModel = SignUpModel.fromJson(responsedata);
      emit(SignUpLoadedStates(signUpModel:signUpModel));
    }
    else{
      Map<String, dynamic> responseerror = jsonDecode(response.body);
      String error = responseerror['message'];
      emit(SignUpErrorStates(error: error));
    }
  }
}

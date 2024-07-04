import 'dart:developer';

import 'package:apitrial/screens/signup/blocs/signupbloc.dart';
import 'package:apitrial/screens/signup/blocs/signupstates.dart';
import 'package:apitrial/screens/signup/controllers/signupcontroller.dart';
import 'package:apitrial/screens/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
          centerTitle: true,
        ),
        body: BlocConsumer<SignUpBloc, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpLoadedStates) {
              log(state.signUpModel.data!.username.toString());
            } else if (state is SignUpErrorStates) {
              log(state.error.toString());
            }
          },
          builder: (context, state) {
            if (state is SignUpLoadingStates) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.CustomTextField(
                      emailController, "Enter email", Icons.email),
                  UiHelper.CustomTextField(
                      passwordController, "Enter password", Icons.password),
                  UiHelper.CustomTextField(
                      usernameController, "Enter username", Icons.person),
                  UiHelper.CustomTextField(
                      phoneController, "Enter phone", Icons.phone),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        SignUpController.SignUp(
                            emailController.toString(),
                            passwordController.toString(),
                            usernameController.toString(),
                            phoneController.toString(),
                            context);
                      },
                      child: Text("Signup"))
                ],
              ),
            );
          },
        ));
  }
}

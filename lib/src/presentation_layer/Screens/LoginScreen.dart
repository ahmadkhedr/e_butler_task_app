// ignore_for_file: prefer_const_constructors

import 'package:e_butler_task/src/business_logic_layer/Blocs/LoginBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                emailTextField(bloc),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: passWordTestField(bloc),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                ),
                submitButton(bloc)
              ]),
        ),
      ),
    );
  }

  Widget emailTextField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: ((BuildContext context, snapshot) {
        return 
        
        
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(width: 0.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blue),
              // ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              alignLabelWithHint: true,
              suffix: const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              hintText: 'youremail@gmail.com',
              label: Text("Your Email Address"),
              errorText: snapshot.hasError ? snapshot.error.toString() : null),
          onChanged: (String input) {
            bloc.emailChange(input);
          },
        );
      
      
      }),
    );
  }

  Widget passWordTestField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: ((context, snapshot) {
        return TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(width: 0.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blue),
              // ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              alignLabelWithHint: true,
              hintText: 'your Password',
              label: Text("Your Password"),
              //  contentPadding: EdgeInsets.all(10.0),
              suffix: const Icon(
                Icons.password,
                color: Colors.blue,
              ),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blue),
              // ),
              errorText: snapshot.hasError ? snapshot.error.toString() : null),
          onChanged: bloc.changePassword,
        );
      }),
    );
  }

  Widget submitButton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.submitStream,
        builder: ((context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasError || !snapshot.hasData
                ? null
                : (() {
                   FocusScope.of(context).requestFocus(FocusNode());
                  bloc.submit(context);
                }),
            child: Text("Submit"),
          );
        }));
  }
}

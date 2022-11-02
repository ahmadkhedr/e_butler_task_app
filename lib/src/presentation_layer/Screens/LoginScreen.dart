// ignore_for_file: prefer_const_constructors

import 'package:e_butler_task/src/business_logic_layer/Blocs/LoginBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              emailTextField(bloc),
              passWordTestField(bloc),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton(bloc)
            ]),
      ),
    );
  }

  Widget emailTextField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: ((BuildContext context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
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
              hintText: 'your Password',
              label: Text("Your Password"),
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
                : (() => bloc.submit(context)),
            child: Text("Submit"),
          );
        }));
  }
}

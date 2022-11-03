// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic_layer/Blocs/SingleUserBLoc.dart';

class EditUserScreen extends StatelessWidget {
  String userId;
  EditUserScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    var userBloc = Provider.of<SingleUserBLoc>(context);
    userBloc.getUserData(userId);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 5.h, right: 3.sp, left: 3.sp, bottom: 10.h),
              child: Text(
                "EditUserScreen",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            StreamBuilder(
                stream: userBloc.singleUserStream,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Center(
                          child: Column(
                            children: [
                              //  Text(snapshot.data!.name!),
                              emailTextField(userBloc, snapshot.data!.name!),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child:
                                    submitButton(userBloc, snapshot.data!.id!),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 100.h,
                          width: 1000.w,
                          child: Center(child: CircularProgressIndicator()),
                        );
                })
          ],
        ),
      ),
    ));
  }

  Widget emailTextField(SingleUserBLoc bloc, String userName) {
    return StreamBuilder(
      stream: bloc.userMailStream,
      builder: ((BuildContext context, snapshot) {
        return TextField(
          keyboardType: TextInputType.text,
          // controller: TextEditingController(text: userName,),
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
                Icons.person,
                color: Colors.blue,
              ),
              hintText: userName,
              label: Text("Your Name"),
              errorText: snapshot.hasError ? snapshot.error.toString() : null),
          onChanged: (String input) {
            bloc.addMail(input);
          },
        );
      }),
    );
  }

  Widget submitButton(SingleUserBLoc bloc, String userId) {
    return StreamBuilder(
        stream: bloc.userMailStream,
        builder: ((context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasError || !snapshot.hasData
                ? null
                : (() {
                    FocusScope.of(context).requestFocus(FocusNode());
                    bloc.submitStream(context, userId);
                  }),
            child: Text("Submit"),
          );
        }));
  }
}

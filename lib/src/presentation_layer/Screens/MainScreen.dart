// ignore_for_file: prefer_const_constructors, prefer_is_empty, sized_box_for_whitespace

import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic_layer/Blocs/AllUsersBloc.dart';
import '../../data_layer/Models/RemoteModels/UserModel.dart';
import '../Widgets/UserItem.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<UserModel> usersList = [];

  @override
  Widget build(BuildContext context) {
    var usersBloc = Provider.of<AllUsersBloc>(context);
    usersBloc.getUsers();
    return Scaffold(
        body: NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        final metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          bool isTop = metrics.pixels == 0;
          if (isTop) {
          } else {
            usersBloc.getUsers();
          }
        }
        return true;
      },
      child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(), child: users(usersBloc)),
    ));
  }

  Widget users(AllUsersBloc bloc) {
    return StreamBuilder(
      stream: bloc.allUsersStream,
      builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
        snapshot.hasData ? usersList.addAll(snapshot.data!) : null;
        return snapshot.hasData && usersList.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, right: 3.sp, left: 3.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Users",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        InkWell(
                            onTap: () {
                              openFilterDelegate(
                                context,
                                usersList,
                              );
                            },
                            child: Icon(Icons.search))
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: usersList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: UserItem(
                            user: usersList[index],
                            isDetails: false,
                          ),
                        );
                      }),
                  snapshot.connectionState == ConnectionState.active &&
                          usersList.length > 0
                      ? Padding(
                          padding:
                              const EdgeInsets.only(bottom: 30.0, top: 30.0),
                          child: Center(
                            child: CupertinoActivityIndicator(
                              //color: Colors.red,
                              radius: 15.0,
                            ),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              )
            : Container(
                height: 100.h,
                width: 100.w,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }

  void openFilterDelegate(
      BuildContext context, List<UserModel> userList) async {
    await FilterListDelegate.show<UserModel>(
      context: context,
      list: userList,
      enableOnlySingleSelection: true,
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      tileLabel: (user) => user!.name,
      emptySearchChild: Center(child: Text('No users found')),
      searchFieldHint: 'Type User Name Here..',
      onApplyButtonClick: (list) {
        // Do something with selected list
      },
    );
  }
}

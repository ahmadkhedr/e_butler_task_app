// import 'package:filter_list/filter_list.dart';
// import 'package:flutter/material.dart';

// import '../../data_layer/Models/RemoteModels/UserModel.dart';

// class FilterPage extends StatelessWidget {
//   const FilterPage({Key? key, this.selectedUserList,this.allUssrsList}) : super(key: key);
//   final List<UserModel>? selectedUserList;
//   final List<UserModel>? allUssrsList;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FilterListWidget<UserModel>(
//         listData: allUssrsList,
//         selectedListData: selectedUserList,
//         onApplyButtonClick: (list) {
//           // do something with list ..
//         },
//         choiceChipLabel: (item) {
//           /// Used to display text on chip
//           return item!.name;
//         },
//         validateSelectedItem: (list, val) {
//           ///  identify if item is selected or not
//           return list!.contains(val);
//         },
//         onItemSearch: (user, query) {
//           /// When search query change in search bar then this method will be called
//           ///
//           /// Check if items contains query
//           return user.name!.toLowerCase().contains(query.toLowerCase());
//         },
//       ),
//     );
//   }
// }

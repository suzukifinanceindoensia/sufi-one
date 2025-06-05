import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/zeus/widgets/profile_zeus.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart';

class TaskAssignView extends StatelessWidget {
  const TaskAssignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: ZeusSidebar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCardZeus(
                  image: "https://storage.googleapis.com/website-production/uploads/2017/10/stock-photo-guide-cheesy-celebration.jpg", 
                  name: "name", 
                  username: "username", 
                  profession: "profession", 
                  borders: 0),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //search bar with filtering options
                  //all data
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

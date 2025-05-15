import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sufi_one/app/modules/survey/features/process/controllers/process_controller.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/widgets/appBar_widget.dart';
import 'package:sufi_one/app/modules/survey/widgets/app_bar_widget.dart';
import 'package:sufi_one/app/modules/survey/widgets/tab_bar_widget.dart';

class SurveyProcessView extends GetView<SurveyProcessController> {
  const SurveyProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyProcessController>(
      init:
          SurveyProcessController(), // Temporary for direct injection (we'll move this to bindings)
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: SurveyAppBarWidget(
            menus: [
              SurveyMenuModel(
                title: "Refresh",
                iconData: FontAwesomeIcons.arrowsRotate,
                onTap: controller.refreshData,
              ),
              SurveyMenuModel(
                title: "Refresh",
                iconData: FontAwesomeIcons.arrowsRotate,
                onTap: controller.refreshData,
              ),
            ],
          ),
          backgroundColor: const Color(0xFFF5F4F4),
          body: Column(
            children: [
              TabBarWidget.buildTabBar(controller.selectedTabIndex),
              // Page content area
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    //dummy func
                    print("Pull-to-refresh triggered...");
                    await Future.delayed(const Duration(seconds: 1));
                    print("Dummy data refreshed");
                  },
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      listItem(),
                      listItem(),
                      listItem(),
                      listItem(),
                      // SizedBox(height: 250),
                      // Center(child: Text('Pull down to refresh')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TabMenu extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final bool isSelected;

  const TabMenu({
    super.key,
    required this.icon,
    required this.label,
    required this.route,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Get.toNamed(route),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 20, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    label,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listItem({
  Widget? floatingChild,
  String? deviceHandlesPrefix,
  bool? enableTap = true,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(2, 2),
            blurRadius: 2,
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade400,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ("151225050005"),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ("Konsumen dapat dihubungi"),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            intl.DateFormat(
                              "dd MMM yyyy HH:mm:ss",
                            ).format(DateTime.parse('2025-05-01 07:07:07')),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "0 Hari  0 jam 0 menit",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        consumerData(),
                        deviceHandles(
                          deviceHandlesPrefix:
                              "In Progres At $deviceHandlesPrefix",
                        ),
                      ],
                    ),
                    floatingChild ?? const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget deviceHandles({String? deviceHandlesPrefix}) {
  return Container(
    color: Colors.transparent,
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          deviceHandlesPrefix ?? deviceHandlesPrefix!,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Roboto",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          "A10 SM08274",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Roboto",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget consumerData() {
  List<Map<String, dynamic>> data = [
    {
      "id": 113,
      "code": "CUST_NAME",
      "label": "NAMA LENGKAP PEMOHON",
      "value": "JONI",
    },
    {
      "id": 118,
      "code": "MOBILE_PHN_NO_1",
      "label": "NOMOR TELEPON/WHATSAPP PEMOHON",
      "value": "08677777888",
    },
    {
      "id": 131,
      "code": "QMH0002",
      "label": "CEK JARAK ALAMAT DOMISILI",
      "value": "8.5400",
    },
  ];
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
    color: Colors.transparent,
    // width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(data.length, (index) {
        return Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(bottom: 5),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.transparent,
                child: Text(
                  data[index]['label'] ?? "",
                  style: TextStyle(
                    color: const Color(0xff707070),
                    fontFamily: 'roboto',
                    fontSize: 12,
                  ),
                ),
              ),

              Container(
                color: Colors.transparent,
                child: Text(
                  "${data[index]["value"]}",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    ),
  );
}

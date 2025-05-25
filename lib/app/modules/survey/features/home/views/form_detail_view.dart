import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/home/controllers/detail_controller.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/utils/text_style.dart';
import 'package:sufi_one/app/modules/survey/widgets/app_bar_widget.dart';

class SurveyFormDetailView extends GetView<SurveyFormDetailController> {
  const SurveyFormDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SurveyAppBarWidget(menus: [SurveyMenuModel(title: "Process")]),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: TabBar(
                controller: controller.tabController,
                labelColor: const Color(0xFF003399),
                indicatorColor: const Color(0xFF003399),
                indicatorAnimation: TabIndicatorAnimation.elastic,
                tabs:
                    controller.tabs
                        .map((tab) => Tab(text: tab['name'].toString()))
                        .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children:
                    controller.tabs.map((tab) {
                      // return Center(child: Text('Content of ${tab['name']}'));
                      return SingleChildScrollView(child: form());
                    }).toList(),
                // children: [SingleChildScrollView(child: form())],
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget form() {
  return Column(children: [pages()]);
}

Widget pages() {
  return Card(
    child: Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(children: [page()]),
    ),
  );
}

Widget page() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: Colors.white),
    child: Column(
      children: [
        Container(
          height: 25,
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: double.infinity,
          alignment: Alignment.centerRight,
          color: Colors.transparent,
          child: Text(
            "ORDER IN",
            style: SurveyTextStyles.boldTitleLabel.copyWith(fontSize: 20),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Column(
            children: [
              questionGroup(),
              questionGroup(),
              questionGroup(),
              questionGroup(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget questionGroup() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 5, bottom: 10),
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // group?.name ?? "",
          "TIPE PEMOHON",
          style: SurveyTextStyles.boldTitleLabel.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            children: [
              question(),
              question(color: Colors.grey.shade300),
              question(),
              question(color: Colors.grey.shade300),
              question(),
              question(color: Colors.grey.shade300),
              question(),
              question(color: Colors.grey.shade300),
              question(),
              question(color: Colors.grey.shade300),
              question(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget question({Color? color}) {
  return Container(
    decoration: BoxDecoration(
      // color: Colors.white,
      color: color ?? Colors.white,
    ),
    child: Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              color: Colors.transparent,
              child: RichText(
                text: TextSpan(
                  // text: questionModel?.label ?? "",
                  text: "label",
                  style: SurveyTextStyles.basicLabel,
                  children: [
                    TextSpan(
                      text: "*",
                      // text: questionModel?.mandatory == true ? "*" : "",
                      style: SurveyTextStyles.basicLabelDanger.copyWith(
                        fontFeatures: [const FontFeature.subscripts()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
              child: Text('value'),
            ),
          ),
        ],
      ),
    ),
  );
}

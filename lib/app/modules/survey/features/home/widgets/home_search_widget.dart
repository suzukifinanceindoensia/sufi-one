import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/home/controllers/home_controller.dart';
import 'package:sufi_one/app/modules/survey/utils/color.dart';
import 'package:sufi_one/app/modules/survey/utils/text_style.dart';

class SurveyHomeSearchBox extends StatelessWidget {
  SurveyHomeSearchBox({super.key});

  final SurveyHomeController controller = Get.find<SurveyHomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: Material(
                child: TextField(
                  controller: controller.searchController,
                  autofocus: false,
                  textInputAction: TextInputAction.search,
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp("[',\"]")),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 15, right: 15),
                    hintText:
                        controller.searchController.text.isEmpty
                            ? "Search"
                            : controller.searchController.text,
                    hintStyle: SurveyTextStyles.basicLabel,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.search, color: SurveyColor.darkTextColor),
            ),
          ),
        ],
      ),
    );
  }
}

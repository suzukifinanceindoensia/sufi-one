import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/widgets/appBar_widget.dart';

class SurveyHome extends StatelessWidget {
  const SurveyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SurveyAppBar(
        menus: [
          SurveyMenuModel(
            title: "Refresh",
            iconData: FontAwesomeIcons.arrowsRotate,
            onTap: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F4F4),
    );
  }
}

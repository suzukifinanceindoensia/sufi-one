import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sufi_one/app/modules/survey/widgets/appBar_widget.dart';

class SurveyHome extends StatelessWidget {
  const SurveyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SurveyAppBar(
        menus: [
          // menus(
          //   title: "Refresh",
          //   iconData: FontAwesomeIcons.sync,
          //   onTap: () {
          //     refresh();
          //   },
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/widgets/avatar_widget.dart';

class SurveyAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double extraHeight;
  final Widget? child;
  final List<SurveyMenuModel> menus;
  final VoidCallback? onTapAvatar;

  const SurveyAppBarWidget({
    super.key,
    this.extraHeight = 0,
    this.child,
    this.menus = const [],
    this.onTapAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF003399),
      toolbarHeight: 140,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  avatar(size: 52),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "DANU PRAKARSA",
                          style: TextStyle(
                            color: const Color(0XFFEEEEEE),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "danu.prakarsa#CMO",
                          style: TextStyle(
                            color: const Color(0XFFEEEEEE),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Menu buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: 8,
                        children: List.generate(menus.length, (index) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFFEEEEEE),
                              // shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8),
                            ),
                            onPressed: menus[index].onTap,
                            child:
                                menus[index].iconData != null
                                    ? Icon(menus[index].iconData)
                                    : Text("${menus[index].title}"),
                          );
                        }),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'v1.1.1',
                          style: TextStyle(
                            color: const Color(0XFFEEEEEE),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120 + extraHeight);
}

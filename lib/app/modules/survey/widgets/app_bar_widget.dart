import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/widgets/avatar_widget.dart';

class SurveyAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double extraHeight;
  final PreferredSizeWidget? bottomChild;
  final List<SurveyMenuModel> menus;
  final VoidCallback? onTapAvatar;

  const SurveyAppBarWidget({
    super.key,
    this.extraHeight = 0,
    this.bottomChild,
    this.menus = const [],
    this.onTapAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF003399),
      toolbarHeight: 140,
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.only(left: 12),
        // width: 52 + 12, // avatar size + left margin
        alignment: Alignment.center,
        child: avatar(
          size: 60,
          onTap: () {
            print("Avatar tapped");
          },
        ),
      ),
      leadingWidth: 80, // Let it size naturally based on child
      title: Column(
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
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            // Set a fixed width, so Column can layout vertically without overflow
            width: 80, // adjust width as needed
            child: Column(
              mainAxisSize: MainAxisSize.min, // Take only necessary height
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: List.generate(menus.length, (index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                      onPressed: menus[index].onTap ?? () {},
                      child:
                          menus[index].iconData != null
                              ? Icon(menus[index].iconData)
                              : Text(
                                "${menus[index].title}",
                                style: const TextStyle(color: Colors.black),
                              ),
                    );
                  }),
                ),
                const SizedBox(height: 4), // space between buttons and version
                Text(
                  'v1.1.1',
                  style: TextStyle(
                    color: const Color(0XFFEEEEEE),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      bottom: bottomChild != null ? bottomChild : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120 + extraHeight);
}

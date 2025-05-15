import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/widgets/avatar_widget.dart';

class SurveyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double extraHeight;
  final Widget? child;
  final List<SurveyMenuModel> menus;
  final VoidCallback? onTapAvatar;

  const SurveyAppBar({
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
      toolbarHeight: 120 + extraHeight,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          // make global later
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Center(
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.transparent,
                                  child: avatar(
                                    // onTap: () {
                                    //   if (onTapAvatar != null) {
                                    //     onTapAvatar!();
                                    //   } else {
                                    //     Navigator.of(System.data.context)
                                    //         .pushNamed(
                                    //       RouteName.profileView,
                                    //     );
                                    //   }
                                    // },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "DANU PRAKARSA",
                                              style: TextStyle(
                                                color: const Color(0XFFEEEEEE),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                              softWrap: true,
                                              // "${System.data.global.user?.name}",
                                              // style: System.data.textStyles!
                                              //     .boldTitleLightLabel
                                              //     .copyWith(
                                              //   fontSize: 25,
                                              // ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            width: double.infinity,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "DANU.PRAKARSA#CMO".toLowerCase(),
                                              style: TextStyle(
                                                color: const Color(0XFFEEEEEE),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                              // "${System.data.global.user?.username}",
                                              // style: System.data.textStyles!
                                              //     .boldTitleLightLabel
                                              //     .copyWith(
                                              //   fontSize: System.data.font!.m,
                                              // ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            top: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(menus.length, (index) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 0, 30, 89),
                                  ),
                                  // backgroundColor: MaterialStateProperty.all(
                                  //     System.data.color!.darkBackground),
                                  side: MaterialStateProperty.all(
                                    const BorderSide(color: Colors.white),
                                  ),
                                ),
                                onPressed: menus[index].onTap,
                                child:
                                    menus[index].iconData != null
                                        ? Icon(menus[index].iconData)
                                        : Text("${menus[index].title}"),
                              );
                            }),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '1.1.1',
                            // System.data.versionName,
                            style: TextStyle(
                              color: const Color(0XFFEEEEEE),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(height: extraHeight, color: Colors.white, child: child),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120 + extraHeight);
}

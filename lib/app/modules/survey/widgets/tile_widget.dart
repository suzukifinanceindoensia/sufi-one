import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/models/application_model.dart';
import 'package:sufi_one/app/modules/survey/models/application_snap_shoot_model.dart';
import 'package:sufi_one/app/modules/survey/survey_routes.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sufi_one/app/modules/survey/utils/color.dart';
import 'package:sufi_one/app/modules/survey/utils/text_style.dart';

class SurveyTile extends StatefulWidget {
  final SurveyApplicationModel task;
  final VoidCallback? onTap;

  const SurveyTile({super.key, required this.task, this.onTap});

  @override
  State<SurveyTile> createState() => _SurveyTileState();
}

class _SurveyTileState extends State<SurveyTile> {
  final Rx<Duration> _elapsed = Duration.zero.obs;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final submissionDate = widget.task.submissionDate ?? now;

      final elapsed = now.difference(submissionDate);
      _elapsed.value = elapsed.isNegative ? Duration.zero : elapsed;
    });
  }

  String _formatDuration(Duration dur) {
    final days = dur.inDays;
    final hours = dur.inHours - days * 24;
    final minutes = dur.inMinutes - dur.inHours * 60;
    return "$days Hari $hours jam $minutes menit";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          widget.onTap ??
          () {
            Get.toNamed(SurveyRoutes.surveyFormDetail);
          },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2, 2),
              blurRadius: 2,
            ),
          ],
          border: Border.all(color: Colors.grey.shade400),
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
                              (widget.task.submissionNumber ?? ""),
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (widget.task.submitMessage ?? ""),
                              style: const TextStyle(
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
                              widget.task.submissionDate == null
                                  ? "-"
                                  : intl.DateFormat(
                                    "dd MMM yyyy HH:mm:ss",
                                  ).format(
                                    widget.task.submissionDate ??
                                        DateTime.now(),
                                  ),
                              style: SurveyTextStyles.basicLabel,
                            ),
                            Obx(
                              () => Text(
                                _formatDuration(_elapsed.value),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          _consumerData(context, widget.task.data ?? []),
                          widget.task.deviceModel!.isEmpty
                              ? SizedBox()
                              : _deviceHandles(
                                deviceHandlesPrefix: widget.task.deviceModel,
                              ),
                        ],
                      ),
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
}

Widget _consumerData(
  BuildContext context,
  List<ApplicationSnapshootModel?> data,
) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
    color: Colors.transparent,
    width: MediaQuery.of(context).size.width,
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
                  data[index]?.label ?? "",
                  style: SurveyTextStyles.basicLabel.copyWith(
                    color: SurveyColor.unselected,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Text(
                  "${data[index]?.value}",
                  style: SurveyTextStyles.boldTitleLabel,
                ),
              ),
            ],
          ),
        );
      }),
    ),
  );
}

Widget _deviceHandles({String? deviceHandlesPrefix}) {
  return Container(
    color: Colors.transparent,
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Processed at: ',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Roboto",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          deviceHandlesPrefix!,
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

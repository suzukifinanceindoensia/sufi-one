import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/models/application_model.dart';
import 'package:sufi_one/app/modules/survey/survey_routes.dart';
import 'package:sufi_one/app/modules/survey/widgets/tile_widget.dart';

class SlidableSurveyTaskTile extends StatelessWidget {
  final SurveyApplicationModel task;

  const SlidableSurveyTaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(task.submissionId), // ensure unique key
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.4,
        children: [
          Flexible(
            flex: 1, // Ensure non-zero
            child: Container(
              color: Colors.transparent,
              height: double.infinity,
              width: (MediaQuery.of(context).size.width - 40) * 30 / 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Get.toNamed(
                        SurveyRoutes.surveyFormInput,
                        arguments: task,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // your delete logic here
                    },
                  ),
                  const SizedBox(height: 8),
                  IconButton(
                    icon: const Icon(Icons.info_outline, color: Colors.grey),
                    onPressed: () {
                      // your info logic here
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.4,
        children: [
          SlidableAction(
            onPressed: (_) {
              Get.toNamed(SurveyRoutes.surveyFormDetail);
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.visibility,
            label: 'Detail',
          ),
          SlidableAction(
            onPressed: (_) {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text("Confirm Delete"),
                      content: const Text(
                        "Are you sure you want to delete this?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Your delete logic
                            Navigator.pop(context);
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    ),
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: SurveyTile(
        task: task,
        onTap: () {
          Get.toNamed(SurveyRoutes.surveyFormInput);
        },
      ),
    );
  }
}

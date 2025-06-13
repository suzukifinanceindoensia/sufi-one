import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/zeus/models/zeushome_model.dart';
import 'package:sufi_one/app/modules/zeus/feature/taskAssign/controller/taskAssign_controller.dart';

class TaskAssignDetailPopup extends StatelessWidget {
  final ZeushomeModel taskDetail;

  const TaskAssignDetailPopup({super.key, required this.taskDetail});

  @override
  Widget build(BuildContext context) {
    // Get an instance of the TaskAssignController
    final TaskAssignController mainController = Get.find<TaskAssignController>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15),
                Text(
                  'Task yang diambil ${taskDetail.platNomor}',
                  style: AppTextStyles.bigBody.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(height: 16, thickness: 2, color: Colors.black54,),
                Text('Tipe Mobil: ${taskDetail.tipeMobil}', style: AppTextStyles.bigBody, textAlign: TextAlign.left,),
                Text('Status: ${taskDetail.status}', style: AppTextStyles.bigBody, textAlign: TextAlign.left,),
                Text('SKMBJ: ${taskDetail.skmbj}', style: AppTextStyles.bigBody, textAlign: TextAlign.left,),
                Text('No SKMBJ: ${taskDetail.noSkmbj}', style: AppTextStyles.bigBody, textAlign: TextAlign.left,),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    ElevatedButton(
                      style: AppButtonStyle.primaryButtonStyle(),
                      onPressed: () {
                        mainController.requestSkmbjForTask(taskDetail.platNomor);
                        Get.back();
                      },
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          "Request SKMBJ",
                          style: AppTextStyles.buttonFont.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Batal",
                        style: AppTextStyles.buttonFont.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
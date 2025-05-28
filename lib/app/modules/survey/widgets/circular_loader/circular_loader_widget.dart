import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_controller.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_state.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_value.dart';

class CircularLoaderWidget extends StatelessWidget {
  final CircularLoaderController controller;
  final Widget? child;
  final bool cover;
  final Widget Function()? loadingBuilder;

  const CircularLoaderWidget({
    Key? key,
    required this.controller,
    this.child,
    this.cover = true,
    this.loadingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CircularLoaderValue>(
      valueListenable: controller,
      builder: (ctx, value, widget) {
        return GestureDetector(
          onTap: controller.close,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: Stack(
              children: [
                child ?? const SizedBox(),
                if (cover && value.state != CircularLoaderState.idle)
                  Container(
                    color: Colors.grey.shade400.withAlpha((0.6 * 255).toInt()),
                    child: _buildChildByState(value),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChildByState(CircularLoaderValue value) {
    switch (value.state) {
      case CircularLoaderState.idle:
        return const SizedBox();
      case CircularLoaderState.onLoading:
        return loadingBuilder?.call() ?? _buildLoading(value);
      case CircularLoaderState.showError:
        return _buildError(value);
      case CircularLoaderState.showMessage:
        return _buildMessage(value);
    }
  }

  Widget _buildLoading(CircularLoaderValue value) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(strokeWidth: 4),
            ),
            if (value.loadingMessage?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(value.loadingMessage!),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(CircularLoaderValue value) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(15),
        width: 400,
        decoration: _defaultBoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            value.icon ??
                const Icon(
                  FontAwesomeIcons.checkCircle,
                  color: Colors.green,
                  size: 50,
                ),
            const SizedBox(height: 20),
            if (value.message?.contains("<div") == true)
              SizedBox(
                height: 300,
                child: SingleChildScrollView(child: Html(data: value.message)),
              )
            else
              Text(value.message ?? "Success", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildError(CircularLoaderValue value) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(15),
        width: 400,
        decoration: _defaultBoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            value.icon ??
                const Icon(
                  FontAwesomeIcons.timesCircle,
                  color: Colors.red,
                  size: 50,
                ),
            const SizedBox(height: 20),
            value.messageWidget ??
                (value.message?.contains("<div") == true
                    ? SizedBox(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Html(data: value.message),
                      ),
                    )
                    : Text(
                      value.message ?? "Error",
                      textAlign: TextAlign.center,
                    )),
          ],
        ),
      ),
    );
  }

  BoxDecoration _defaultBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: Colors.grey),
    boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5)],
  );
}

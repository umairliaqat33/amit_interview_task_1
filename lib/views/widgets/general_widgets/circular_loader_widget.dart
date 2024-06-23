import 'package:amit_interview_task_1/utils/colors.dart';
import 'package:flutter/material.dart';

class CircularLoaderWidget extends StatelessWidget {
  const CircularLoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
      ),
    );
  }
}

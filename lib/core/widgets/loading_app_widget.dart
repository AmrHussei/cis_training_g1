import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class LoadingAppWidget extends StatelessWidget {
  const LoadingAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            color: AppColors.primary(context),
            strokeWidth: 8,
            backgroundColor: AppColors.backgroundGrey(context),
          ),
        ),
      ],
    );
  }
}

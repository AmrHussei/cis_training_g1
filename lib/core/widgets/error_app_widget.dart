import 'package:cis_training_g1/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class ErrorAppWidget extends StatelessWidget {
  const ErrorAppWidget({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String? text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: text!.toLowerCase().contains('nointernet')
            ? NoInterNetErrorWidget(onTap: onTap)
            : ErrorTextWidget(text: text, onTap: onTap),
      ),
    );
  }
}

class NoInterNetErrorWidget extends StatelessWidget {
  const NoInterNetErrorWidget({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 105),
          SvgPicture.asset(Assets.imagesNoInterNetIcon),
          SizedBox(height: 24),
          Text(
            'يرجى التحقق من اتصالك بالإنترنت!',
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleBold24(context).copyWith(
              color: AppColors.typographyHeading(context),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'تأكد من توافر خدمة الأنترنت وأعد المحاولة',
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleMedium16(context).copyWith(
              color: AppColors.typographySubTitle(context),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: onTap,
            child: Text(
              'اعدالمحاولة',
              maxLines: 3,
              style: AppStyles.styleBold16(context).copyWith(
                color: AppColors.secondColor(context),
              ),
            ),
            style: OutlinedButton.styleFrom(
              fixedSize: Size(180, 54),
              side: BorderSide(
                width: 1,
                color: AppColors.primary(context),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              foregroundColor: AppColors.primary(context),
            ),
          )
        ],
      ),
    );
  }
}

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String? text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.7.sw,
              child: Text(
                text ?? 'حدث شئ ما خطأ',
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleBold16(context).copyWith(
                  color: AppColors.typographyBody(context),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: onTap,
          child: Text(
            'اعدالمحاولة',
            maxLines: 3,
            style: AppStyles.styleBold16(context).copyWith(
              color: AppColors.white(context),
            ),
          ),
        )
      ],
    );
  }
}

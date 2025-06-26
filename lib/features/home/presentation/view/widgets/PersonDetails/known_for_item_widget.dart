import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:flutter/material.dart';

class KnownForItemWidget extends StatelessWidget {
  final KnownFor work;

  const KnownForItemWidget({
    super.key,
    required this.work,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(context).withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            work.title ?? 'No Title',
            style: AppStyles.styleBold16(context),
          ),
          const SizedBox(height: 8),
          if (work.overview?.isNotEmpty ?? false) ...[
            Text(
              work.overview ?? '',
              style: AppStyles.styleMedium12(context).copyWith(
                color: AppColors.typographySubTitle(context),
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
          ],
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: AppColors.warrningColor(context),
              ),
              const SizedBox(width: 4),
              Text(
                work.voteAverage.toStringAsFixed(1),
                style: AppStyles.styleMedium12(context),
              ),
              const SizedBox(width: 16),
              Text(
                work.releaseDate ?? '',
                style: AppStyles.styleMedium12(context).copyWith(
                  color: AppColors.typographySubTitle(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

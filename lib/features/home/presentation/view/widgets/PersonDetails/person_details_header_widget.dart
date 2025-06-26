import 'package:cached_network_image/cached_network_image.dart';
import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:cis_training_g1/features/home/data/models/person_details_model.dart';
import 'package:flutter/material.dart';

class PersonDetailsHeaderWidget extends StatelessWidget {
  final PersonDetailsModel? personDetails;
  final Person? personData;

  const PersonDetailsHeaderWidget({
    super.key,
    required this.personDetails,
    this.personData,
  });

  @override
  Widget build(BuildContext context) {
    final profilePath = personDetails?.profilePath ?? personData?.profilePath;
    final name = personDetails?.name ?? personData?.name ?? 'Unknown';
    final department = personDetails?.knownForDepartment ??
        personData?.knownForDepartment ??
        'Unknown';
    final popularity =
        personDetails?.popularity ?? personData?.popularity ?? 0.0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary(context),
            AppColors.primary(context).withOpacity(0.8),
          ],
        ),
      ),
      child: Stack(
        children: [
          // صورة الخلفية
          if (profilePath != null)
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500$profilePath',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.backgroundGrey(context),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.backgroundGrey(context),
                ),
              ),
            ),
          // طبقة شفافة
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.primary(context).withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          // المحتوى
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppStyles.styleBold28(context).copyWith(
                    color: AppColors.white(context),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  department,
                  style: AppStyles.styleMedium16(context).copyWith(
                    color: AppColors.white(context).withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: AppColors.white(context),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Popularity: ${popularity.toStringAsFixed(1)}',
                      style: AppStyles.styleMedium14(context).copyWith(
                        color: AppColors.white(context),
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

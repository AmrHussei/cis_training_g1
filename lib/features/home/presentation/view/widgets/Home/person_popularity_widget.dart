import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:flutter/material.dart';

class PersonPopularityWidget extends StatelessWidget {
  final Person person;

  const PersonPopularityWidget({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary(context).withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.trending_up,
                size: 12,
                color: AppColors.primary(context),
              ),
              const SizedBox(width: 4),
              Text(
                person.popularity.toStringAsFixed(1),
                style: AppStyles.styleMedium12(context).copyWith(
                  color: AppColors.primary(context),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: AppColors.iconsTertiary(context),
            size: 20,
          ),
        ),
      ],
    );
  }
}

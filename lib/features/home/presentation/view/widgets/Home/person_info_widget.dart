import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:flutter/material.dart';

class PersonInfoWidget extends StatelessWidget {
  final Person person;

  const PersonInfoWidget({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          person.name ?? 'No Name',
          style: AppStyles.styleBold16(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          person.knownForDepartment ?? 'No Department',
          style: AppStyles.styleMedium12(context).copyWith(
            color: AppColors.primary(context),
          ),
        ),
        const SizedBox(height: 8),
        if (person.knownFor.isNotEmpty) ...[
          Text(
            'Known For:',
            style: AppStyles.styleMedium12(context).copyWith(
              color: AppColors.typographySubTitle(context),
            ),
          ),
          const SizedBox(height: 4),
          KnownForListWidget(knownFor: person.knownFor),
        ],
      ],
    );
  }
}

class KnownForListWidget extends StatelessWidget {
  final List<KnownFor> knownFor;

  const KnownForListWidget({
    super.key,
    required this.knownFor,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: knownFor.take(3).map((work) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightGreen(context),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            work.title ?? 'No Title',
            style: AppStyles.styleMedium12(context).copyWith(
              color: AppColors.primary(context),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}

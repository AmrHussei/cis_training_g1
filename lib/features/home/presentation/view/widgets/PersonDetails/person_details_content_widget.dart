import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:cis_training_g1/features/home/data/models/person_details_model.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/PersonDetails/known_for_item_widget.dart';
import 'package:flutter/material.dart';

class PersonDetailsContentWidget extends StatelessWidget {
  final PersonDetailsModel? personDetails;
  final Person? personData;

  const PersonDetailsContentWidget({
    super.key,
    required this.personDetails,
    this.personData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBiographySection(context),
          const SizedBox(height: 24),
          _buildPersonalInfoSection(context),
          const SizedBox(height: 24),
          _buildKnownForSection(context),
        ],
      ),
    );
  }

  Widget _buildBiographySection(BuildContext context) {
    final biography = personDetails?.biography;

    if (biography == null || biography.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biography',
          style: AppStyles.styleBold20(context),
        ),
        const SizedBox(height: 12),
        Text(
          biography,
          style: AppStyles.styleMedium14(context).copyWith(
            color: AppColors.typographyBody(context),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoSection(BuildContext context) {
    final birthday = personDetails?.birthday;
    final placeOfBirth = personDetails?.placeOfBirth;
    final homepage = personDetails?.homepage;
    final imdbId = personDetails?.imdbId;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Information',
          style: AppStyles.styleBold20(context),
        ),
        const SizedBox(height: 16),
        _buildInfoRow(context, 'Birthday', birthday ?? 'Unknown'),
        _buildInfoRow(context, 'Place of Birth', placeOfBirth ?? 'Unknown'),
        if (homepage != null && homepage.isNotEmpty)
          _buildInfoRow(context, 'Homepage', homepage, isLink: true),
        if (imdbId != null && imdbId.isNotEmpty)
          _buildInfoRow(context, 'IMDB ID', imdbId),
      ],
    );
  }

  Widget _buildKnownForSection(BuildContext context) {
    final knownFor = personData?.knownFor ?? [];

    if (knownFor.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Known For',
          style: AppStyles.styleBold20(context),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: knownFor.length,
          itemBuilder: (context, index) {
            final work = knownFor[index];
            return KnownForItemWidget(work: work);
          },
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value,
      {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppStyles.styleMedium14(context).copyWith(
                color: AppColors.typographySubTitle(context),
              ),
            ),
          ),
          Expanded(
            child: isLink
                ? GestureDetector(
                    onTap: () {
                      // يمكن إضافة فتح الرابط هنا
                    },
                    child: Text(
                      value,
                      style: AppStyles.styleMedium14(context).copyWith(
                        color: AppColors.primary(context),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                : Text(
                    value,
                    style: AppStyles.styleMedium14(context).copyWith(
                      color: AppColors.typographyBody(context),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

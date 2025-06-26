import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:cis_training_g1/features/home/data/models/person_details_model.dart';
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
            return _buildKnownForItem(context, work);
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

  Widget _buildKnownForItem(BuildContext context, KnownFor work) {
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

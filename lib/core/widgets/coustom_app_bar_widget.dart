import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_images.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  CoustomAppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.hight,
  });
  final String title;
  List<Widget>? actions;
  Widget? leading;
  PreferredSizeWidget? bottom;
  double? hight;

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);

    return AppBar(
      bottom: bottom,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: hight ?? 64,
      centerTitle: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.imagesAppBarBG,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppStyles.styleBold18(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      actions: actions,
      leadingWidth: canPop ? 46 : 0,
      leading: leading != null
          ? SizedBox.shrink()
          : canPop
              ? InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    padding: EdgeInsetsDirectional.only(start: 8),
                    margin: EdgeInsetsDirectional.only(
                      start: 12,
                      top: 12,
                      bottom: 12,
                    ),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        Assets.imagesArrowLeftLong,
                        fit: BoxFit.contain,
                        color: AppColors.white(context),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hight ?? 64);
}

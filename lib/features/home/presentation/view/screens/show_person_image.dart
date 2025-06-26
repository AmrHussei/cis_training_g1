import 'package:cis_training_g1/core/functions/url_luncher.dart';
import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:share_plus/share_plus.dart';

class ShowPersonImage extends StatefulWidget {
  const ShowPersonImage({super.key});

  @override
  State<ShowPersonImage> createState() => _ShowPersonImageState();
}

class _ShowPersonImageState extends State<ShowPersonImage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final imagePath = context.read<HomeCubit>().imagePath;

    if (imagePath == null || imagePath.isEmpty) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundPrimary(context),
          appBar: AppBar(
            backgroundColor: AppColors.primary(context),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.white(context),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Image Viewer',
              style: TextStyle(color: AppColors.white(context)),
            ),
          ),
          body: const Center(
            child: Text('No image available'),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withValues(alpha: 0.5),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: AppColors.white(context),
            ),
            onPressed: () => _shareImage(imagePath),
          ),
          IconButton(
            icon: _isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white(context),
                    ),
                  )
                : Icon(
                    Icons.download,
                    color: AppColors.white(context),
                  ),
            onPressed: _isLoading ? null : () => _downloadImage(imagePath),
          ),
        ],
      ),
      body: InstaImageViewer(
        child: Image.network(
          imagePath,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                color: AppColors.white(context),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 64,
                    color: AppColors.white(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load image',
                    style: TextStyle(
                      color: AppColors.white(context),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _shareImage(String imagePath) async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          text: 'Check out this amazing image: $imagePath',
          subject: 'Shared Image',
        ),
      );
    } catch (e) {
      _showSnackBar('Failed to share image: $e');
    }
  }

  Future<void> _downloadImage(String imagePath) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await downloadFile(imagePath, context);

      result.fold(
        (failure) {
          _showSnackBar('Download failed: ${failure.message}');
        },
        (success) {
          _showSnackBar('Image downloaded successfully!');
        },
      );
    } catch (e) {
      _showSnackBar('Failed to download image: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary(context),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}

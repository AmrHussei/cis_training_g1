import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../error/failure.dart';
import '../widgets/my_snackbar.dart';

Future<void> openLink(String? url) async {
  if (url == null) return;

  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> callPhoneNumber(String? phoneNumber) async {
  if (phoneNumber == null) return;

  final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw 'Could not call $phoneNumber';
  }
}

Future<void> openEmail({required String? email}) async {
  if (email == null) return;
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    // query: [
    //   if (subject != null) 'subject=${Uri.encodeComponent(subject)}',
    //   if (body != null) 'body=${Uri.encodeComponent(body)}',
    // ].join('&'),
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not open email client for $email';
  }
}

String getFileNameFromUrl(String url) {
  return url.split('/').last;
}

Future<Either<Failure, String>> downloadFile(
  String url,
  BuildContext context,
) async {
  if (url.isEmpty) {
    return Left(AppFailure(message: "URL is empty"));
  }

  final status = await Permission.manageExternalStorage.request();
  if (!status.isGranted) {
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      if (context.mounted) {
        FloatingSnackBar.show(
          context,
          "Storage permission must be granted from app settings!",
          isError: true,
        );
      }
      return Left(AppFailure(
          message: "Storage permission must be granted from settings"));
    }
    return Left(AppFailure(message: "Storage permission denied"));
  }

  Dio dio = Dio();

  try {
    String fileName = getFileNameFromUrl(url);

    if (!fileName.contains('.')) {
      fileName += '.jpg';
    }

    String filePath = "/storage/emulated/0/Download/$fileName";

    await dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          double progress = (received / total) * 100;
          debugPrint("Download Progress: ${progress.toStringAsFixed(2)}%");
          if (context.mounted) {
            FloatingSnackBar.show(
              context,
              "Downloading image...",
              progress: progress,
              isError: false,
            );
          }
        }
      },
    );

    await MediaScanner.loadMedia(path: filePath);

    if (context.mounted) {
      FloatingSnackBar.show(
        context,
        "Image downloaded successfully!",
        isError: false,
      );
    }

    return Right("Image downloaded: $filePath");
  } catch (e) {
    if (context.mounted) {
      FloatingSnackBar.show(
        context,
        "Failed to download image: $e",
        isError: true,
      );
    }
    return Left(AppFailure(message: "Download failed: $e"));
  }
}

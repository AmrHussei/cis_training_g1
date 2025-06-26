import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

void mySnackBar(String message, BuildContext ctx, {bool isError = true}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(8)
          .copyWith(bottom: MediaQuery.of(ctx).viewInsets.bottom + 8),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}

class FloatingSnackBar {
  static void show(
    BuildContext context,
    String message, {
    bool isError = true,
    double? progress,
  }) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.05, // Adjust height
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isError ? AppColors.danger(context) : Colors.green,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // Softer shadow color
                    blurRadius: 2, // Slight blur for a subtle effect
                    spreadRadius: 0.1, // Minimal spread
                    offset: Offset(0, 1), // Light bottom shadow for depth
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(isError ? Icons.error : Icons.check_circle,
                          color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  if (progress != null) ...[
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progress / 100,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${progress.toStringAsFixed(1)}%",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Insert Overlay
    overlayState.insert(overlayEntry);

    // Auto-dismiss after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}

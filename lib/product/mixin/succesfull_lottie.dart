import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';

/// This mixin is used to show a successful Lottie animation.
mixin SuccesFullLottie {
  /// This function shows a successful Lottie animation.
  void succesFullLottie(GlobalKey<ScaffoldState> scaffoldKey) {
    OverlayEntry? overlayEntry; // Declare overlayEntry as nullable

    overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: SizedBox(
          width: context.sized.dynamicWidth(0.7),
          height: context.sized.dynamicHeight(0.7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.lottie.lottieExplosion.lottie(
                package: 'gen',
                fit: BoxFit.contain,
                onLoaded: (composition) {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      overlayEntry?.remove();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    // Check if the scaffoldKey has a currentContext and if it's not null
    if (scaffoldKey.currentContext != null) {
      // Use the non-null assertion operator to avoid null warnings
      Overlay.of(scaffoldKey.currentContext!).insert(overlayEntry);
    }
  }
}

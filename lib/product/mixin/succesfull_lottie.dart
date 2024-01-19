import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';

mixin SuccesFullLottie {
  void succesFullLottie(BuildContext context) {
    OverlayEntry? overlayEntry; // Declare overlayEntry as nullable

    overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: SizedBox(
          width: context.sized.dynamicWidth(0.7),
          height: context.sized.dynamicHeight(0.7),
          child: Column(
            children: [
              Assets.lottie.lottieSubIsSuccess.lottie(
                package: 'gen',
                fit: BoxFit.contain,
                onLoaded: (composition) {
                  Future.delayed(
                    const Duration(seconds: 3),
                    () {
                      overlayEntry
                          ?.remove(); // Use the safe navigation operator
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(context)
        .insert(overlayEntry); // Use the non-null assertion operator
  }
}

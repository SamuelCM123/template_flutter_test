import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_test/router/app_router.dart';
import 'package:template_flutter_test/shared/widgets/toast/toast.dart';

class ToastService {
  static Timer? _timer;
  static OverlayEntry? _overlayEntry;
  static bool _isClosing = false;

  static void showToast({
    required String title,
    required String message,
    required String type,
    Duration duration = const Duration(seconds: 7),
  }) {
    // Cierra cualquier toast anterior
    _timer?.cancel();
    _forceClose();

    final overlayState = NavigationService.overlay;
    AnimationController? fadeOutController;

    _isClosing = false;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: FadeInRight(
            manualTrigger: true,
            duration: const Duration(milliseconds: 300),
            controller: (fadeIn) {
              fadeIn.forward();

              // Programar fade out con Timer
              _timer = Timer(duration, () {
                _startFadeOut(fadeOutController);
              });
            },
            child: FadeOutRight(
              manualTrigger: true,
              duration: const Duration(milliseconds: 300),
              controller: (fadeOut) {
                fadeOutController = fadeOut;
                fadeOut.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    _forceClose();
                  }
                });
              },
              child: Toast(
                title: title,
                message: message,
                type: type,
                duration: duration,
                onClose: () {
                  _startFadeOut(fadeOutController);
                },
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(_overlayEntry!);
  }

  static void _startFadeOut(AnimationController? fadeOutController) {
    if (!_isClosing) {
      _isClosing = true;
      try {
        fadeOutController?.forward();
      } catch (_) {
        _forceClose();
      }
    }
  }

  static void _forceClose() {
    _isClosing = true;
    _timer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

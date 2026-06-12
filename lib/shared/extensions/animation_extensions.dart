import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension WidgetAnimationExtension on Widget {
  Widget animateRightLeft({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
    bool isFromStart = true,
  }) {
    return animate()
        .fadeIn(duration: duration, delay: delay, curve: Curves.easeInOutQuart)
        .moveX(
          delay: delay,
          begin: isFromStart ? 50 : -50,
          end: 0,
          duration: duration,
          curve: Curves.easeInOutQuart,
        );
  }

  Widget animateBottomToTop({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
    bool isFromBottom = true,
  }) {
    return animate()
        .fadeIn(duration: duration, delay: delay, curve: Curves.easeInOutQuart)
        .moveY(
          delay: delay,
          begin: isFromBottom ? 50 : -50,
          end: 0,
          duration: duration,
          curve: Curves.easeInOutQuart,
        );
  }

  Widget animateHalfGrayToNormalColorRepeated({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).desaturate(
      begin: 0.5,
      end: 1.0,
      delay: delay,
      duration: duration,
      curve: Curves.easeInOutQuart,
    );
  }

  Widget animateShimmer({
    List<Color>? colors,
    Duration duration = const Duration(milliseconds: 1500),
    Duration delay = const Duration(milliseconds: 500),
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).shimmer(delay: delay, duration: duration, colors: colors);
  }

  Widget animateShakeAlarm({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 2500),
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(),
    ).shake(hz: 10, delay: delay, duration: duration);
  }
  Widget animateFlipVertical({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) {
    return animate().flipV(
      alignment: alignment,
      begin: 0.5,
      end: 0,
      delay: delay,
      duration: duration,
      curve: Curves.easeInOutQuart,
    );
  }

  
  Widget animateFlipHorizontal({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) {
    return animate().flipH(
      alignment: alignment,
      begin: 0.5,
      end: 0,
      delay: delay,
      duration: duration,
      curve: Curves.easeInOutQuart,
    );
  }


  Widget animateRotate({
    Duration duration = const Duration(seconds: 1),
    Duration delay = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) {
    return animate().rotate(
      alignment: alignment,
      begin: 0.5,
      end: 1,
      curve: Curves.easeInOutQuart,
      delay: delay,
      duration: duration,
    );
  }

 
  Widget animateScaleNFadeVertical({
    Duration duration = const Duration(milliseconds: 1000),
    Duration delay = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) {
    return animate(onPlay: (controller) => controller.repeat(reverse: true))
        .fadeIn(duration: 500.ms, delay: delay, curve: Curves.easeInOutQuart)
        .scaleY(
          alignment: alignment,
          begin: 0.5,
          end: 1,
          curve: Curves.easeInOutQuart,
          delay: delay,
          duration: duration,
        );
  }

  
  Widget animateScaleNFadeHorizontal({
    Duration duration = const Duration(milliseconds: 1000),
    Duration delay = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) {
    return animate()
        .fadeIn(duration: 500.ms, delay: delay, curve: Curves.easeInOutQuart)
        .scaleX(
          alignment: alignment,
          begin: 0.0,
          end: 1,
          curve: Curves.easeInOutQuart,
          delay: delay,
          duration: duration,
        );
  }

  Widget animateSlideTopToNormal({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
  }) {
    return animate().slide(delay: delay, duration: duration);
  }

  Widget animateAfterDurationHide({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
    bool maintain = false,
  }) {
    return animate().hide(maintain: maintain, delay: delay, duration: duration);
  }

  Widget animateAfterDurationVisibility({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
    bool maintain = false,
  }) {
    return animate().visibility(
      maintain: maintain,
      delay: delay,
      duration: duration,
    );
  }

  Widget animateBlur({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(milliseconds: 500),
  }) {
    return animate().blur(
      end: const Offset(0, 0),
      begin: const Offset(2, 2),
      delay: delay,
      duration: duration,
      curve: Curves.easeInOutQuart,
    );
  }
}
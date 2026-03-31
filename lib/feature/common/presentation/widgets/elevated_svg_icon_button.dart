import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_scanner_practice/core/constants/app_textstyles.dart';
import 'package:qr_scanner_practice/core/extensions/context_extensions.dart';

class ElevatedSvgIconButton extends StatelessWidget {
  const ElevatedSvgIconButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    this.iconSize = 24,
    this.isLoading = false,
    this.isEnabled = true,
    this.iconColor,
    super.key,
  });

  final String icon;
  final double iconSize;
  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final bool isButtonDisabled = !isEnabled || isLoading;

    return ElevatedButton.icon(
      onPressed: isButtonDisabled ? null : onPressed,
      icon: isLoading
          ? SizedBox(
              width: iconSize,
              height: iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.appColors.surfaceL1,
              ),
            )
          : SvgPicture.asset(
              icon,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(
                isButtonDisabled
                    ? context.appColors.textDisabled
                    : (iconColor ?? context.appColors.textInversePrimary),
                BlendMode.srcIn,
              ),
            ),
      label: Text(
        isLoading ? context.locale.loading : label,
        style: AppTextStyles.airbnbCerealW500S16Lh24Ls0.copyWith(
          color: isButtonDisabled
              ? context.appColors.textDisabled
              : context.appColors.textInversePrimary,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor.withValues(alpha: 0.6),
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
        padding: const .symmetric(horizontal: 32, vertical: 16),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.mint),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomSvg(
                      asset: "assets/icons/upload.svg",
                      color: AppColors.mint,
                      size: 36,
                    ),
                    Text(
                      "Select file",
                      style: AppTexts.tmdr.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 100, width: 1, color: AppColors.secondaryText),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomSvg(
                      asset: "assets/icons/camera.svg",
                      color: AppColors.mint,
                      size: 36,
                    ),
                    Text(
                      "Capture",
                      style: AppTexts.tmdr.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

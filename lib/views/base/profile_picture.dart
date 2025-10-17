import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neoterra/utils/custom_image_picker.dart';
import 'package:neoterra/utils/custom_svg.dart';

class ProfilePicture extends StatelessWidget {
  final double size;
  final String? image;
  final File? imageFile;
  final double borderWidth;
  final Color? borderColor;
  final bool showLoading;
  final bool isEditable;
  final bool disableGesture;
  final Function(File)? imagePickerCallback;

  const ProfilePicture({
    super.key,
    this.image,
    this.size = 120,
    this.showLoading = true,
    this.isEditable = false,
    this.disableGesture = false,
    this.imagePickerCallback,
    this.imageFile,
    this.borderWidth = 1,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: isEditable
          ? () async {
              File? image = await customImagePicker();

              if (image != null && imagePickerCallback != null) {
                imagePickerCallback!(image);
              }
            }
          : null,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: borderColor == null
                  ? null
                  : Border.all(width: borderWidth, color: borderColor!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: imageFile != null
                  ? Image.file(
                      imageFile!,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
                  : image != null
                  ? CachedNetworkImage(
                      imageUrl: image!,
                      progressIndicatorBuilder: (context, url, progress) {
                        return SizedBox(
                          width: size,
                          height: size,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                              strokeWidth: 2,
                              color: AppColors.cyan[400],
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Container(
                          width: size,
                          height: size,
                          color: AppColors.cyan[100],
                          child: Icon(Icons.error, color: Colors.cyan),
                        );
                      },
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: size,
                      height: size,
                      padding: EdgeInsets.all(size * 0.17),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // border: Border.all(color: AppColors.cyan[300]!),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/user.svg",
                          colorFilter: ColorFilter.mode(
                            AppColors.cyan[400]!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          if (isEditable)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CustomSvg(asset: "assets/icons/camera.svg"),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

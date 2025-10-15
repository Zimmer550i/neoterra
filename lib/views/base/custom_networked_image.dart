import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkedImage extends StatelessWidget {
  final String? url;
  final File? file;
  final String? randomSeed;
  final double? height;
  final double? width;
  final double radius;
  final bool shimmer;
  final BoxFit? fit;

  const CustomNetworkedImage({
    super.key,
    this.url,
    this.randomSeed,
    this.height,
    this.width,
    this.radius = 10,
    this.fit = BoxFit.cover,
    this.shimmer = true,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: file != null
          ? Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
      )
          : CachedNetworkImage(
        imageUrl: url ??
            "https://picsum.photos/${randomSeed == null ? "" : "seed/$randomSeed/"}${(width ?? 400).toInt()}/${(height ?? 400).toInt()}",
        height: height,
        width: width,
        fit: fit,
        // ✅ Prevent RenderFlex overflow by shrinking the column and truncating text
        errorWidget: (context, url, error) {
          return Container(
            height: height,
            width: width,
            color: Colors.grey.shade300,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // <-- shrink-wrap
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.broken_image, color: Colors.red),
                    const SizedBox(height: 6),
                    Text(
                      // error can be Exception/Object – stringify safely
                      error.toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2, // <-- constrain
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        placeholder: (context, url) {
          if (!shimmer) {
            return Container(
              height: height ?? width,
              width: width ?? height,
              color: Colors.white,
            );
          }
          return Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: AppColors.coral,
            period: const Duration(milliseconds: 800),
            child: Container(
              height: height ?? width,
              width: width ?? height,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

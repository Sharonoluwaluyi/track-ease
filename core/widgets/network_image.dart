import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart' show AppColors;

class CustomNetworkImage extends StatelessWidget {
  final String imageurl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const CustomNetworkImage(
      {super.key, required this.imageurl, this.fit, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageurl,
      fit: fit ?? BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeInCurve: Curves.easeIn,
      width: width,
      height: height,
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          color: AppColors.borderColor,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          color: AppColors.borderColor,
        ),
      ),
    );
  }
}

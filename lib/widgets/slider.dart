import 'package:flutter/material.dart';
import 'package:nikeshop/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/banners.dart';
import '../utils/cached_image.dart';

class SliderBanners extends StatelessWidget {
  final List<BannersList> banners;

  const SliderBanners({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller,
              itemCount: banners.length,
              itemBuilder: (context, index) {
                return CachedImageService(
                  borderRadius: BorderRadius.circular(12),
                  imageurl: banners[index].imageUrl,
                );
              },
            ),
            SmoothPageIndicator(
              controller: controller,
              count: banners.length,
              effect: const ExpandingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: LightThemColor.primaryTetxColor),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nikeshop/theme.dart';
import 'package:nikeshop/utils/cached_image.dart';
import 'package:nikeshop/utils/commome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/banners.dart';

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
              physics: defultScroll,
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
                  dotHeight: 4,
                  activeDotColor: LightThemColor.primaryTetxColor),
            )
          ],
        ),
      ),
    );
  }
}

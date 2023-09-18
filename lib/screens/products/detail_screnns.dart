import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/model/products.dart';
import 'package:nikeshop/theme.dart';
import 'package:nikeshop/utils/cached_image.dart';
import 'package:nikeshop/utils/commome.dart';

class ProductsDetailScreens extends StatelessWidget {
  final ProductsList products;
  const ProductsDetailScreens({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final themdata = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 48,
        child: FloatingActionButton.extended(
            onPressed: () {}, label: const Text('افزودن به سبد خرید')),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width * 0.8,
              flexibleSpace: CachedImageService(imageurl: products.imageUrl),
              foregroundColor: LightThemColor.primaryTetxColor,
              actions: const [
                Icon(CupertinoIcons.heart),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(products.title,
                            style: themdata.textTheme.labelLarge),
                        Column(
                          children: [
                            Text(
                              products.privoucePrice.withPriceLable,
                              style: themdata.textTheme.bodySmall!.apply(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(products.price.withPriceLable),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                        'اگر بخواهیم یک کفش را با توجه به نوع طراحی آن به بخش‌های مختلفی تقسیم کنیم می‌توانیم به رویه، زیره، لایه میانی و تودوزی اشاره کنیم. هر کفش بسته به نوع کاربردی که دارد، در هر یک از قسمت‌های نامبرده شده، ویژگی‌های خاصی خواهد داشت. '),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'نظر کاربران',
                          style: themdata.textTheme.bodySmall,
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('ثبت نظر'))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

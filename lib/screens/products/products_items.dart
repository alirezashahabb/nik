import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/model/products.dart';
import 'package:nikeshop/screens/products/detail_screnns.dart';
import 'package:nikeshop/utils/cached_image.dart';
import 'package:nikeshop/utils/commome.dart';

/// this is ProduductItems
class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.product,
    required this.them,
    required this.borderRadius,
  });

  final ProductsList product;
  final ThemeData them;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductsDetailScreens(products: product),
            ),
          );
        },
        child: SizedBox(
          width: 176,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 176,
                    height: 176,
                    child: CachedImageService(
                      imageurl: product.imageUrl,
                      borderRadius: borderRadius,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CupertinoIcons.heart,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  product.privoucePrice.withPriceLable,
                  style: them.textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  product.price.withPriceLable,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

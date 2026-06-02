import 'package:anotherwanandroidflutter/features/article/model/banner_data.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:anotherwanandroidflutter/utils/utils_string.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key, required this.banners});

  final List<BannerData> banners;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      height: screenWidth / 1920 * 1080,
      child: Swiper(
        // physics: const NeverScrollableScrollPhysics(),
        key: UniqueKey(),
        itemCount: banners.length,
        itemBuilder: (BuildContext context, int index) {
          BannerData banner = banners[index];
          return Stack(
            alignment: Alignment(0, 1),
            children: <Widget>[
              GestureDetector(
                child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        UtilsString.parseInvalidUrl(banner.imagePath ?? ''),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  context.push(Routes.articleDetail, extra: {'banner': banner});
                },
              ),
              Opacity(
                opacity: 0.5, //不透明度
                child: Container(width: 999, height: 40.0, color: Colors.grey),
              ),
              Opacity(
                opacity: 1, //不透明度
                child: Container(
                  width: 999,
                  height: 40.0,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 30),
                  child: Text(
                    "${banner.title}",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          );
        },
        autoplay: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            size: 7,
            activeSize: 7,
            activeColor: Color(0xFFFC9900),
          ),
        ),
      ),
    );
  }
}

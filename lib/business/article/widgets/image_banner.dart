import 'package:anotherwanandroidflutter/business/article/models/bannerdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({Key key, @required this.banners}) : super(key: key);

  final List<BannerData> banners;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenWidth / 1920 * 700,
      child: Swiper(
        itemCount: banners.length,
        itemBuilder: (BuildContext context, int index) {
          BannerData banner = banners[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 13),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    banner.imagePath??''
                  ),
                )),
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

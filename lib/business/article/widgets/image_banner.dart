import 'package:anotherwanandroidflutter/business/article/models/banner_data.dart';
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
      height: screenWidth / 1920 * 1000,
      child: Swiper(
        itemCount: banners.length,
        itemBuilder: (BuildContext context, int index) {
          BannerData banner = banners[index];
          return new Stack(alignment: new Alignment(0, 1), children: <Widget>[
            Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(banner.imagePath ?? ''),
                  )),
            ),
            new Opacity(
              opacity: 0.5, //不透明度
              child: new Container(
                width: 999,
                height: 40.0,
                color: Colors.grey,
              ),
            ),
            new Opacity(
              opacity: 1, //不透明度
              child: new Container(
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
          ]);
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

import 'route_handlers.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String home = "/";
  static String login = "/login";
  static String search = "/search";
  static String collect = "/collect";

  static void configRoutes(FluroRouter router) {
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(search, handler: searchHandler);
    router.define(collect, handler: collectHandler);
    router.notFoundHandler = emptyHandler;
  }
}

import 'package:anotherwanandroidflutter/features/article/ui/article_detail_page.dart';
import 'package:anotherwanandroidflutter/features/collect/ui/collect_list_page.dart';
import 'package:anotherwanandroidflutter/features/home/home_screen.dart';
import 'package:anotherwanandroidflutter/features/login/ui/login_page.dart';
import 'package:anotherwanandroidflutter/features/search/ui/search_page.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_items_list_page.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_items_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

enum SlideDirection { right, left, up, down }

extension GoRouterStateExtension on GoRouterState {
  SlideRouteTransition slidePage(
    Widget child, {
    SlideDirection direction = SlideDirection.left,
  }) {
    return SlideRouteTransition(
      key: pageKey,
      child: child,
      direction: direction,
    );
  }
}

class SlideRouteTransition extends CustomTransitionPage<void> {
  SlideRouteTransition({
    required super.key,
    required super.child,
    SlideDirection direction = SlideDirection.left,
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curve = CurvedAnimation(
             parent: animation,
             curve: Curves.easeInOut,
           );

           Offset begin;
           switch (direction) {
             case SlideDirection.right:
               begin = const Offset(-1.0, 0.0);
               break;
             case SlideDirection.left:
               begin = const Offset(1.0, 0.0);
               break;
             case SlideDirection.up:
               begin = const Offset(0.0, 1.0);
               break;
             case SlideDirection.down:
               begin = const Offset(0.0, -1.0);
               break;
           }
           final tween = Tween(begin: begin, end: Offset.zero);
           final offsetAnimation = tween.animate(curve);

           return SlideTransition(position: offsetAnimation, child: child);
         },
       );
}

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => state.slidePage(const HomeScreen()),
    ),
    GoRoute(
      path: Routes.articleDetail,
      pageBuilder: (context, state) {
        final map = state.extra as Map?;
        return state.slidePage(
          ArticleDetailPage(article: map?['article'], banner: map?['banner']),
        );
      },
    ),
    GoRoute(
      path: Routes.search,
      pageBuilder: (context, state) => state.slidePage(const SearchPage()),
    ),
    GoRoute(
      path: Routes.treeItems,
      pageBuilder: (context, state) {
        final map = state.extra as Map?;
        return state.slidePage(
          TreeItemsPage(
            tabs: map?['tabs'],
            index: map?['index'],
            title: map?['title'],
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.treeItemsList,
      pageBuilder: (context, state) {
        final map = state.extra as Map?;
        return state.slidePage(TreeItemsListPage(params: map ?? {}));
      },
    ),
    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) => state.slidePage(const LoginPage()),
    ),
    GoRoute(
      path: Routes.collectList,
      pageBuilder: (context, state) => state.slidePage(const CollectListPage()),
    ),
  ],
);

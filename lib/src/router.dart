import 'package:dev_widgets/src/tools.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'impl/layout/yaru/ui/yaru_layout.dart';

final GoRouter router = GoRouter(initialLocation: '/home', routes: <GoRoute>[
  for (final tool in allTools)
    GoRoute(
      path: tool.route,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          _buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: ResponsiveWrapper.builder(
                YaruLayout(
                  tools: allTools,
                  child: tool.page,
                ),
                breakpoints: [
                  const ResponsiveBreakpoint.autoScale(360),
                  const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                  const ResponsiveBreakpoint.resize(640, name: 'MOBILE_LARGE'),
                  const ResponsiveBreakpoint.resize(850, name: TABLET),
                  const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
                  const ResponsiveBreakpoint.resize(1440,
                      name: 'DESKTOP_LARGE'),
                  const ResponsiveBreakpoint.resize(2460, name: '4K'),
                ],
              )),
    )
]);

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

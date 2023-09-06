import 'package:flutter/material.dart';
import 'package:geo_alarm_riverpod/features/alarm/alarm.dart';
import 'package:geo_alarm_riverpod/features/home/home.dart';
import 'package:geo_alarm_riverpod/features/map/ui/map_screen.dart';
import 'package:go_router/go_router.dart';

final routerNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: routerNavKey,
  initialLocation: '/map',
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/map',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: MapView(),
                  );
                }),
            GoRoute(
                path: '/alarm',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: Container(),
                  );
                }),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/settings',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: Container(),
                  );
                }),
          ],
        ),
      ],
      builder: (context, state, child) => HomeScreen(
        shell: child,
      ),
    ),
    GoRoute(
        name: 'alarm',
        path: '/ararm',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const AlarmScreen(),
          );
        })
  ],
);

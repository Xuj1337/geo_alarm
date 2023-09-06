import 'package:flutter/material.dart';
import 'package:geo_alarm_riverpod/navigation/router.dart';

import 'core_logic/core_logic.dart';
import 'core_ui/core_ui.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Geo Alarm',
      scaffoldMessengerKey: UtilsService.messangerStateKey,
      builder: (context, child) {
        return Scaffold(
          body: child ?? const CircularProgressIndicator(),
        );
      },
      theme: createTheme(),
    );
  }
}

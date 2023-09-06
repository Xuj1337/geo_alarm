import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/app.dart';

import 'core_ui/core_ui.dart';

void main() => runZonedGuarded(
      () async {
        runApp(
          const ProviderScope(
            child: KLoading(
              child: App(),
            ),
          ),
        );
      },
      (error, stack) {},
    );

import 'package:flutter/material.dart';
import 'package:geo_alarm_riverpod/core_ui/core_ui.dart';

class KScaffold extends StatelessWidget {
  const KScaffold(
      {this.title,
      this.bottom,
      required this.body,
      this.withBackButton = true,
      super.key});
  final String? title;
  final bool withBackButton;
  final Widget body;
  final Widget? bottom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null,
      body: Padding(
        padding: KEdgeInsets.a16,
        child: body,
      ),
      bottomNavigationBar: bottom,
    );
  }
}

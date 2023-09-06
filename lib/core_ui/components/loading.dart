// Flutter imports:
import 'package:flutter/material.dart';

import '../core_ui.dart';

// Project imports:

/// корневой виджет, отрисовывающий анимацию загрузки поверх остальных виджетов
/// через контекст предоставляет методы для старта/завершения загрузки
class KLoading extends StatefulWidget {
  const KLoading({
    required this.child,
  });
  final Widget child;

  @override
  KLoadingState createState() => KLoadingState();
}

class KLoadingState extends State<KLoading> {
  late List<String?> loadings;

  @override
  void initState() {
    loadings = <String?>[];
    super.initState();
  }

  void start([String? message]) {
    setState(() {
      loadings = <String?>[...loadings, message];
    });
  }

  void end() {
    assert(loadings.isNotEmpty);
    setState(() {
      loadings = loadings.sublist(0, loadings.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 120),
            child: loadings.isNotEmpty
                ? Container(
                    color: Colors.white.withAlpha(95),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: KBorderRadius.a16,
                          color: Colors.grey.shade100,
                        ),
                        padding: KEdgeInsets.a32,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                            if (loadings.last != null) ...[
                              KSizedBox.h32,
                              Text(
                                loadings.last!,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

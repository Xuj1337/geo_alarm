import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class MapBottomSheet extends StatelessWidget {
  const MapBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panelBuilder: () {
        return Container(
          height: 150,
        );
      },
    );
  }
}

import 'package:drinking_game/telas/selection/button_widget.dart';
import 'package:flutter/material.dart';

class BeerGridview extends StatelessWidget {
  const BeerGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              name: 'Antarctica',
              index: 1,
            ),
            ButtonWidget(
              name: 'Brahma',
              index: 2,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              name: 'Kaiser',
              index: 3,
            ),
            ButtonWidget(
              name: 'Heineken',
              index: 4,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              name: 'Petra',
              index: 5,
            ),
          ],
        ),
      ],
    );
  }
}

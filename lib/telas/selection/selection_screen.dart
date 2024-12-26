import 'package:drinking_game/controller/game_controller.dart';
import 'package:drinking_game/style.dart';
import 'package:drinking_game/telas/selection/confirmation/confirmation_screen.dart';
import 'package:drinking_game/telas/selection/beer_gridview.dart';
import 'package:drinking_game/widgets/custom_app_bar.dart';
import 'package:drinking_game/widgets/send_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Consumer<GameController>(
        builder: (context, controller, _) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomAppBar(text: (controller.currentPlayerIndex == 0) ? 'Resposta' : (controller.playerList[controller.currentPlayerIndex - 1].name),),
                const BeerGridview(),
              ],
            ),
            SendButton(
              enabled: context.read<GameController>().selectedAnswer != 0,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => const ConfirmationScreen()));
            },)
          ],
        ),
      ),
    );
  }
}
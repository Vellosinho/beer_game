import 'package:drinking_game/controller/game_controller.dart';
import 'package:drinking_game/model/player_class.dart';
import 'package:drinking_game/style.dart';
import 'package:drinking_game/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Consumer<GameController>(
        builder: (BuildContext context, GameController controller, _) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                const CustomAppBar(text: 'Fim de jogo'),
                SizedBox(
                  height: controller.playerList.length > 8 ? controller.playerList.length * 70 : 569,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.playerList.length,
                    itemBuilder: (BuildContext context, int index) => PlayerItem(player: controller.playerList[index])))
              ],),
            ],
          ),
        ),
      )
    );
  }
}


class PlayerItem extends StatelessWidget {
  final Player player;
  const PlayerItem({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon((player.points == context.read<GameController>().highestScore)? FontAwesomeIcons.crown : FontAwesomeIcons.solidUser, color: (player.points == context.read<GameController>().highestScore)? Colors.amber[300] : Colors.white, size: 24),
              const SizedBox(width: 24),
              Text(player.name, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),]
          ),
          Text(player.points.toString(), style: GoogleFonts.montserrat(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
} 
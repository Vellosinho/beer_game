import 'package:drinking_game/controller/game_controller.dart';
import 'package:drinking_game/style.dart';
import 'package:drinking_game/telas/game_over_screen/game_over_screen.dart';
import 'package:drinking_game/telas/selection/selection_screen.dart';
import 'package:drinking_game/widgets/custom_app_bar.dart';
import 'package:drinking_game/widgets/send_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (BuildContext context, GameController controller, Widget? child) => Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const CustomAppBar(text: 'Confirmar Escolha', closable: true,),
                Stack(
                  children: [
                    SizedBox(child: controller.selectedAnswer == 0 ? const SizedBox() : ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(BeerImage().getImage(controller.selectedAnswer),
                      fit: BoxFit.cover,
                      height: 320,),)),
                    SizedBox(
                      height: 320,
                      width: 320,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            width: 4,
                            color: ColorPalette.unselectedAnswerColor),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(controller.selectedAnswerName, style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),)
              ],
            ),
            SendButton(onTap: (){
              if(controller.currentPlayerIndex == 0) {
                controller.confirmCorrectAnswer();
                controller.updateCurrentPlayer();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectionScreen()));
              } else if(controller.currentPlayerIndex == (controller.playerList.length)){
                controller.confirmSelection();
                controller.updateCurrentPlayer();
                controller.updateCurrentGame();
                if(controller.currentRound > 4) {
                  controller.finishGame();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GameOverScreen()));
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectionScreen()));
                }
              } else {
                controller.confirmSelection();
                controller.updateCurrentPlayer();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectionScreen()));
              }
            }),
          ],
        ),
      ),
    );
  }
}
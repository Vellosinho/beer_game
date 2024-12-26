import 'package:drinking_game/controller/game_controller.dart';
import 'package:drinking_game/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String name;
  final int index;
  const ButtonWidget({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (BuildContext context, GameController controller, Widget? child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => controller.chooseAnswer(index, name),
          child: SizedBox(
            height: 160,
            width: 160,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: Image.asset(BeerImage().getImage(index)),
                ),
                SizedBox(
                  height: 160,
                  width: 160,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(24)),
                        border: Border.all(
                          color: controller.selectedAnswer == index ? ColorPalette.selectedAnswerColor: ColorPalette.unselectedAnswerColor,
                          width: 4,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            controller.selectedAnswer == index ? ColorPalette.enabledButtonColor.withAlpha(0) :const Color(0xff454545).withAlpha(0),
                            controller.selectedAnswer == index ? ColorPalette.enabledButtonColor :const Color(0xff454545),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  child: SizedBox(
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

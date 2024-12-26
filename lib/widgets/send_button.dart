import 'package:drinking_game/controller/game_controller.dart';
import 'package:drinking_game/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendButton extends StatelessWidget {
  final String? buttonLabel;
  final Color? enabledColor;
  final Color? disabledColor;
  final bool? enabled;
  final Function onTap;
  const SendButton({super.key, required this.onTap, this.buttonLabel, this.enabledColor, this.disabledColor, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (BuildContext context, GameController controller, Widget? child) => GestureDetector(
        onTap: () { 
          if (enabled ?? true) {
            onTap();
        } },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SizedBox(
            height: 64,
            width: MediaQuery.of(context).size.width - 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: (enabled ?? controller.selectedAnswer != 0) ? 
                  enabledColor ?? ColorPalette.enabledButtonColor
                  : disabledColor ?? ColorPalette.disabledButtonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
              child: Center(
                child: Text(
                buttonLabel ?? 'Confirmar',
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

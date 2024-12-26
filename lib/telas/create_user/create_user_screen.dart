import 'package:drinking_game/controller/game_controller.dart';
import 'package:drinking_game/style.dart';
import 'package:drinking_game/widgets/custom_app_bar.dart';
import 'package:drinking_game/widgets/send_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateUsername extends StatelessWidget {
  const CreateUsername({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const CustomAppBar(text: 'Nome do usuario'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: TextField(
                  controller: textController,
                  cursorColor: Colors.white,
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
                  decoration: const InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              )
            ]
          ),
        SendButton(
          enabled: true,
          onTap: () {
            if(textController.text != '') {
              context.read<GameController>().addPlayer(textController.text);
              Navigator.pop(context);
            }
          }),
        ],
      ),
    );
  }
}

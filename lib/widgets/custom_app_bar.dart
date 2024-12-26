import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final bool? closable;
  const CustomAppBar({super.key, required this.text, this.closable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 24),
          Text(text, style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          SizedBox(child: (closable ?? false) ? GestureDetector(onTap: () {
            Navigator.pop(context);
          },child: const Icon(FontAwesomeIcons.xmark, color: Colors.white, size: 28)) : const SizedBox(width: 24))
        ],
      ),
    );
  }
}
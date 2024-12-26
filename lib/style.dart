import 'dart:ui';

class ColorPalette {
  static const backgroundColor = Color(0xff454545);
  static const unselectedAnswerColor = Color(0xffB1B1B1);
  static const selectedAnswerColor = Color(0xff0BDF00);
  static const disabledButtonColor = Color(0xff888888);
  static const enabledButtonColor = Color(0xff177531);
}

class BeerImage {
  static const antarctica = 'lib/assets/images/antarctica.png';
  static const brahma = 'lib/assets/images/brahma.png';
  static const kaiser = 'lib/assets/images/kaiser.png';
  static const heineken = 'lib/assets/images/heineken.png';
  static const petra = 'lib/assets/images/petra.png';

  String getImage(int value) {
    switch (value) {
      case 1:
        return antarctica;
      case 2:
        return brahma;
      case 3:
        return kaiser;
      case 4:
        return heineken;
      case 5:
        return petra;
      default:
        return antarctica;
    }
  }
}
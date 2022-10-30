import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';

// Tab TextStyle

const bottomTabTextStyle = WhiteSplatfontStyle(fontSize: 15.0);
const upperTabTextStyle = BlueSplatfontStyle(fontSize: 18.0);

// Popup TextStyle

const popupTitleStyle = WhiteSplatfontStyle(fontSize: 20.0);
const popupMessageStyle = BlackSplatfontStyle(fontSize: 16.0);

// Result TextStyle

const topNameStyle = BlackSplatfontStyle(fontSize: 22.0);
const resultTitleStyle = GraySplatfontStyle(fontSize: 14.0);
const resultNameStyle = BlackSplatfontStyle(fontSize: 20.0);
const resultResultStyle = WhiteSplatfontStyle(fontSize: 11.0);
const noResultTextStyle = BlackSplatfontStyle(fontSize: 26.0);

// Report Accept

const headerStyle = BlackSplatfontStyle(fontSize: 18.0);
const hasCompanionStyle = WinColorSplatfontStyle(fontSize: 18.0);

// Common TextStyle

const largeBlackTextStyle = BlackSplatfontStyle(fontSize: 26.0);
const largeWhiteTextStyle = WhiteSplatfontStyle(fontSize: 26.0);

// Button TextStyle

const actionButtonStyle = WhiteSplatfontStyle(fontSize: 26);

// TextFormField TextStyle

const formLabelStyle = SplatfontStyle();
const formHintStyle = TextStyle(
  fontFamily: 'Splatfont',
  color: Color.fromRGBO(211, 211, 211, 1),
);

// Font base

class SplatfontStyle extends TextStyle {
  const SplatfontStyle();

  @override
  String? get fontFamily => 'Splatfont';
}

// TextStyle base defines

class WhiteSplatfontStyle extends TextStyle {
  const WhiteSplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => Colors.white;
}

class BlackSplatfontStyle extends TextStyle {
  const BlackSplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => blackColor;
}

// Notification用に複数行の行間調整のためのStyle
class BlackSplatfontMultipleLinesStyle extends TextStyle {
  const BlackSplatfontMultipleLinesStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  double? get height => 1.5;

  @override
  TextLeadingDistribution? get leadingDistribution =>
      TextLeadingDistribution.proportional;

  @override
  Color? get color => blackColor;
}

class BlueSplatfontStyle extends TextStyle {
  const BlueSplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => splaBlueColor;
}

class YellowSplatfontStyle extends TextStyle {
  const YellowSplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => splaYellowColor;
}

class WinColorSplatfontStyle extends TextStyle {
  const WinColorSplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => winColor;
}

class LoseColorSplatfontStyle extends TextStyle {
  const LoseColorSplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => loseColor;
}

class DrawColorSplatfontStyle extends TextStyle {
  const DrawColorSplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => drawColor;
}

class GraySplatfontStyle extends TextStyle {
  const GraySplatfontStyle({required super.fontSize});

  @override
  String? get fontFamily => 'Splatfont';

  @override
  Color? get color => grayColor;
}

part of '../assets.dart';

class _ColorAssets {

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse("0x$hexColor"));
  }

  Color get background => _getColorFromHex("#000000");
  Color get white => _getColorFromHex("#ffffff");
  Color get grey => _getColorFromHex("#9e9e9e");
  Color get blue => _getColorFromHex("#0077b5");
}
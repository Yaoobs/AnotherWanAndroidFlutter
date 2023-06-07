import 'package:anotherwanandroidflutter/common/values/colors.dart';
import 'package:flutter/material.dart';

class UtilsString {
  static fixedHttpStart(String? url) {
    if (url != null && !url.startsWith('http')) return 'https:' + url;
    return url;
  }

  static TextSpan? getTextSpan(String? text, String? key) {
    if (text == null || key == null) {
      return null;
    }

    String splitString1 = "<em class='highlight'>";
    String splitString2 = "</em>";

    String textOrigin =
        text.replaceAll(splitString1, '').replaceAll(splitString2, '');

    TextSpan textSpan = new TextSpan(
        text: key, style: new TextStyle(color: AppColors.colorPrimary));

    List<String> split = textOrigin.split(key);

    List<TextSpan> list = <TextSpan>[];

    for (int i = 0; i < split.length; i++) {
      list.add(new TextSpan(text: split[i]));
      list.add(textSpan);
    }

    list.removeAt(list.length - 1);

    return new TextSpan(children: list);
  }
}

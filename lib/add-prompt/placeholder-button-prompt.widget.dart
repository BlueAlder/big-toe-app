import 'package:flutter/material.dart';

import '../shared/styles.dart';

class PlaceholderButtonPrompt extends StatelessWidget {
  const PlaceholderButtonPrompt({Key? key, required this.appendPlaceholderToPrompt()}) : super(key: key);

  final Function appendPlaceholderToPrompt;

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: Styles.getRegularTextStyle(),
            children: [
              const TextSpan(text: "Use "),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: TextButton(
                    onPressed: () => appendPlaceholderToPrompt(),
                    child: const Text("\$NAME",
                        style:
                        TextStyle(color: Colors.orangeAccent)),
                  )),
              const TextSpan(text: " as placeholders for players "),
            ]));
  }
}

import 'package:flutter/material.dart';

class SpacedBackButton extends StatelessWidget {
  const SpacedBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 25, left: 25),
        child: BackButton(),
    );
  }
}

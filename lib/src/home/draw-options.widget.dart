import 'package:flutter/material.dart';

import '../add-prompt/add-prompt.view.dart';
import '../shared/styles.dart';

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({Key? key}) : super(key: key);

  handleAddPrompt(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const AddPromptView();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Image.asset(
          'assets/icons/launcher.png',
          height: 150,
        ),
        Text("Big Toe", style: Styles.getHeadingStyle()),
        const Divider(thickness: 2, indent: 20, endIndent: 20),
        ListTile(
            leading: const Icon(Icons.add, color: Colors.white,),
            onTap: () => handleAddPrompt(context),
            title:
            Text("Add some prompts", style: Styles.getRegularTextStyle()))
      ],
    );
  }
}

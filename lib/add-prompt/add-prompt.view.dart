import 'package:big_toe_mobile/services/prompt.service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../models/game.model.dart';
import '../services/notification.service.dart';
import '../shared/styles.dart' as styles;

final promptService = GetIt.I.get<PromptService>();
final _notificationService = GetIt.I.get<NotificationService>();

class AddPromptView extends StatefulWidget {
  const AddPromptView({Key? key}) : super(key: key);

  @override
  State<AddPromptView> createState() => _AddPromptViewState();
}

class _AddPromptViewState extends State<AddPromptView> {
  final promptTextController = TextEditingController();

  void handleSubmitPrompt(String promptString, BuildContext context) {
    if (promptString.isEmpty) {
      _notificationService.showSnackBarMessage(
          "Can't submit an empty prompt you fucking idiot", context);
      return;
    }

    if (!promptString.contains(Game.promptPlaceholderWord)) {
      // showSnackBarMessage("You haven't added a placeholder for a name, you sure you wanna submit?", context);
      showConfirmationDialog(context, promptString);
      return;
    }

    promptService.addPrompt(promptString);
    promptTextController.text = "";
  }

  void showConfirmationDialog(BuildContext context, String prompt) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: const Text("Just checking if you're dumb or not"),
                content: Text(
                    "You didn't add any placeholder \$NAMEs you sure you wanna submit this?\n\n $prompt"),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text("I'm a fucken idiot"),
                  ),
                  TextButton(
                    onPressed: () {
                      promptService.addPrompt(prompt);
                      promptTextController.text = "";
                      Navigator.pop(context, "Yes I'm sure");
                    },
                    child: const Text("Yes I'm sure"),
                  ),
                ]));
  }

  appendPlaceholderToPrompt() {
    final newPromptString = promptTextController.text + "\$NAME";
    promptTextController.value = TextEditingValue(
        text: newPromptString,
        selection: TextSelection.fromPosition(
            TextPosition(offset: newPromptString.length)));
  }

  @override
  void dispose() {
    promptTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Stack(
          children: [
            IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add some prompts 😈",
                    textAlign: TextAlign.center,
                    style: styles.getHeadingStyle()),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextField(
                    controller: promptTextController,
                    onSubmitted: (value) => handleSubmitPrompt(value, context),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      hintText: "\$NAME please drink \$NAME's drink",
                      fillColor: Colors.white,
                      focusColor: Colors.red,
                    ),
                  ),
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: styles.getRegularTextStyle(),
                        children: [
                          const TextSpan(text: "Use "),
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: TextButton(
                                onPressed: () => appendPlaceholderToPrompt(),
                                child: const Text("\$NAME", style: TextStyle(color: Colors.orangeAccent)),
                              )),
                          const TextSpan(text: " as placeholders for players "),
                        ]))
                // style: styles.getRegularTextStyle()),
              ],
            ),
            Align(
                // alignment: Alignment.bottomCenter,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              FractionallySizedBox(
                widthFactor: 0.5,
                child: ElevatedButton(
                  onPressed: () =>
                      handleSubmitPrompt(promptTextController.text, context),
                  child: styles.getElevatedButtonChild("Add Prompt",
                      fontSize: 20, paddingAmount: 1),
                  style: styles.getElevatedButtonStyle(),
                ),
              ),
              StreamBuilder(
                  stream: promptService.getStatsSnapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Text("We got ${snapshot.data['count']} prompts");
                    } else if (snapshot.hasError) {
                      return const Text(
                          "There are a lot of prompts, probs like at least 4");
                    } else {
                      return Container();
                    }
                  })
            ]))
          ],
        ));
  }
}

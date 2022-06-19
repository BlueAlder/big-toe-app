import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../add-prompt/placeholder-button-prompt.widget.dart';
import '../add-prompt/prompt-count.widget.dart';
import '../shared/widgets/select-tags.widget.dart';
import '../services/prompt.service.dart';
import '../shared/widgets/back-button.widget.dart';
import '../models/prompt.model.dart';
import '../services/notification.service.dart';
import '../shared/widgets/footer-spacing.widget.dart';
import '../shared/styles.dart';
import '../shared/utils.dart';

final promptService = GetIt.I.get<PromptService>();
final _notificationService = GetIt.I.get<NotificationService>();

class AddPromptView extends StatefulWidget {
  const AddPromptView({Key? key}) : super(key: key);

  @override
  State<AddPromptView> createState() => _AddPromptViewState();
}

class _AddPromptViewState extends State<AddPromptView> {
  final promptTextController = TextEditingController();
  Set<String> selectedTags = {};

  void handleSubmitPrompt(String promptString) {
    if (promptString.isEmpty) {
      _notificationService.showSnackBarMessage(
          "Can't submit an empty prompt you fucking idiot", context);
      return;
    }

    if (!promptString.contains(Prompt.replacementKeyword)) {
      showConfirmationDialog(promptString);
      return;
    }

    addPrompt(promptString);
  }

  void addPrompt(String promptString) {
    final newPrompt = Prompt(promptString).setTags(selectedTags);
    promptService.addPrompt(newPrompt);
    promptTextController.text = "";
  }

  void handleTagChange(Set<String> newTags) {
    selectedTags = newTags;
    debugPrint(selectedTags.toString());
  }

  void showConfirmationDialog(String prompt) {
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
                      addPrompt(prompt);
                      Navigator.pop(context, "Yes I'm sure");
                    },
                    child: const Text("Yes I'm sure"),
                  ),
                ]));
  }

  void appendPlaceholderToPrompt() {
    final newPromptString = promptTextController.text + "\$NAME ";
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
        backgroundColor: Colors.deepPurple,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              const SpacedBackButton(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add some prompts 😈",
                      textAlign: TextAlign.center,
                      style: Styles.getHeadingStyle()),
                  SelectTags(
                    onTagChange: handleTagChange,
                  ),
                  ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: Styles.textFieldWidth),
                      child: TextField(
                          controller: promptTextController,
                          style: const TextStyle(color: Colors.white),
                          onSubmitted: handleSubmitPrompt,
                          decoration: Utils.mergeInputDecoration(
                            Styles.getTextFieldDecorationStyle(),
                            const InputDecoration(
                              hintText: "\$NAME please drink \$NAME's drink",
                            ),
                          ))),
                  PlaceholderButtonPrompt(
                      appendPlaceholderToPrompt: appendPlaceholderToPrompt)
                ],
              ),
              Align(
                  // alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: ElevatedButton(
                        onPressed: () =>
                            handleSubmitPrompt(promptTextController.text),
                        child: Styles.getElevatedButtonChild("Add Prompt",
                            fontSize: 20, paddingAmount: 1),
                        style: Styles.getElevatedButtonStyle(),
                      ),
                    ),
                    PromptCount(),
                    const FooterSpacing()
                  ]))
            ],
          ),
        )
    );
  }
}

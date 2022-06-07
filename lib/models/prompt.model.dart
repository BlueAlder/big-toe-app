import "../shared/utils.dart" ;

class Prompt {
  static const replacementKeyword = "\$NAME";

  String _text;
  final int? _id;

  Prompt(this._text, {int? id}) : _id=id;

  String get text {
    return _text;
  }

  int? get id {
    return _id;
  }

  Prompt setText(String newText) {
    _text = newText;
    return this;
  }

  Prompt formatPrompt(Set<String> players) {
    final availablePlayers = {...players};
    String formattedPrompt = _text;
    if (formattedPrompt.toUpperCase().contains(replacementKeyword)) {
      while(formattedPrompt.contains(replacementKeyword) && availablePlayers.isNotEmpty) {
        final selectedPlayer = Utils.getRandomElementFromArray(availablePlayers) as String;
        formattedPrompt = formattedPrompt.replaceFirst(replacementKeyword, selectedPlayer);
        availablePlayers.remove(selectedPlayer);
      }
    } else {
      formattedPrompt = (Utils.getRandomElementFromArray(availablePlayers) as String) + formattedPrompt;
    }
    return setText(formattedPrompt);
  }

}
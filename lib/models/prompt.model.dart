import "../shared/utils.dart" ;

class Prompt {
  static const replacementKeyword = "\$NAME";

  String _text;
  final int? _id;
  Set<String> _tags = {};

  Prompt(this._text, {int? id}) : _id = id;

  String get text => _text;
  int? get id => _id;
  Set<String> get tags => _tags;

  Prompt setTags(Set<String> newTags) {
    _tags = newTags;
    return this;
  }

  Prompt setText(String newText) {
    _text = newText;
    return this;
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt': _text,
      'tags': _tags.toList()
    };
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
      formattedPrompt = (Utils.getRandomElementFromArray(availablePlayers) as String) + ", " + formattedPrompt;
    }
    return setText(formattedPrompt);
  }

}
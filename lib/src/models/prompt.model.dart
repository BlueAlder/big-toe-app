import "../shared/utils.dart" ;

/// A class to represent an individual prompt in the game
class Prompt {
  /// The placeholder word that get's replaced with a random players name
  /// through the [formatPrompt] function.
  static const replacementKeyword = "\$NAME";

  String _text;
  final int? _id;
  Set<String> _tags = {};

  Prompt(this._text, {int? id}) : _id = id;

  String get text => _text;
  int? get id => _id;
  Set<String> get tags => _tags;

  /// Sets the tags for the [Prompt]
  Prompt setTags(Set<String> newTags) {
    _tags = newTags;
    return this;
  }

  /// Replaces the existing text with [newText]
  Prompt setText(String newText) {
    _text = newText;
    return this;
  }

  /// Returns a json representation of the object.
  ///
  /// This exists so that we can post to Firestore easily.
  Map<String, dynamic> toJson() {
    return {
      'prompt': _text,
      'tags': _tags.toList()
    };
  }

  /// Replaces all instance of [replacementKeyword] in the prompt [_text] with
  /// a random player name.
  ///
  /// This currently works in the following format:
  /// 1. Check if [replacementKeyword] is in the [_text], if no then append a
  ///    random player to the start of the [_text]
  /// 2. If yes then add a unique player to each prompt until either we run out of players
  ///    or all instances of [replacementKeyword] has been replaced.
  /// 3. Set the new text on the [Prompt]
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
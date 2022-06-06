import 'dart:math';

Set<String> prompts = {
  "Aight my name jeff",
  "Where did I leave my toilet paper",
  'Can we go to the park.',
  'Where is the orange cat? Said the big black dog.',
  'We can make the bird fly away if we jump on something.',
  'We can go down to the store with the dog. It is not too far away.',
  'My big yellow cat ate the little black bird.',
  'I like to read my book at school.',
  'We are going to swim at the park.',
  "Aight this is big toe now",
  "Okay this is actually big toe now",
  "okay no this is actually big toe I swear",
  "not h'is is asdjkas🌏🌏🌏🌏🌏",
  "A really rdiasidjaklsjhawskdjfhlasjkhdf lasjkhdflkjashdfjkl liong asuihjksadf jklasdljkf asjklh aklsjdhf lkahsdkljhfalsjkhd fljkahsdl fjha lsdjfh lakshjdfl jkashd fljkahs dfjka lsjdhf lakjshdf nalskdjhf alskjhdf kajnsbd lfkjba ksdjfb kahjsdb fkjahb sdjkhfba sdf"
};

Set<String> getFakePrompts(int numberOfPrompts) {
  if (numberOfPrompts > prompts.length) {
    throw Exception("Not enough prompts");
  }

  Set<String> randomPrompts = {};
  while (randomPrompts.length < numberOfPrompts) {
     String prompt = prompts.elementAt(Random().nextInt(prompts.length));
     randomPrompts.add(prompt);
  }

  randomPrompts.add(prompts.elementAt(prompts.length - 1));

  return randomPrompts;
}


Set<int> generateRandomIntSet(int amount, int max) {
  Set<int> intList = {};
  while (intList.length < amount) {
    intList.add(Random().nextInt(max));
  }

  return intList;
}

Object getRandomElementFromArray(Iterable<Object> iter) {
  print("Iter Length is" +  iter.length.toString());
  return iter.elementAt(Random().nextInt(iter.length));
}
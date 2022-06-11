import 'dart:math';

import 'package:flutter/material.dart';

/// A utility class to do utility things.
class Utils {

  static final Set<String> _prompts = {
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


  static Set<String> getFakePrompts(int numberOfPrompts) {
    if (numberOfPrompts > _prompts.length) {
      throw Exception("Not enough prompts");
    }

    Set<String> randomPrompts = {};
    while (randomPrompts.length < numberOfPrompts) {
      String prompt = _prompts.elementAt(Random().nextInt(_prompts.length));
      randomPrompts.add(prompt);
    }

    randomPrompts.add(_prompts.elementAt(_prompts.length - 1));

    return randomPrompts;
  }


  static Set<int> generateRandomIntSet(int amount, int max) {
    Set<int> intSet = {};

    if (amount > max) {
      throw Exception("Amount cannot be more than max.");
    }
    while (intSet.length < amount) {
      intSet.add(Random().nextInt(max));
    }

    return intSet;
  }

  static List<int> generateRandomIntList(int amount, int max) {
    List<int> intList = [];
    while (intList.length < amount) {
      intList.add(Random().nextInt(max));
    }

    return intList;
  }

  static Object getRandomElementFromArray(Iterable<Object> iter) {
    return iter.elementAt(Random().nextInt(iter.length));
  }

//  Merge helper function for InputDecoration
  static InputDecoration mergeInputDecoration(InputDecoration baseStyle,
      InputDecoration customStyle) {
    return baseStyle.copyWith(
      alignLabelWithHint: customStyle.alignLabelWithHint,
      border: customStyle.border,
      constraints: customStyle.constraints,
      contentPadding: customStyle.contentPadding,
      counter: customStyle.counter,
      counterStyle: customStyle.counterStyle,
      counterText: customStyle.counterText,
      disabledBorder: customStyle.disabledBorder,
      enabled: customStyle.enabled,
      enabledBorder: customStyle.enabledBorder,
      errorBorder: customStyle.errorBorder,
      errorMaxLines: customStyle.errorMaxLines,
      errorStyle: customStyle.errorStyle,
      errorText: customStyle.errorText,
      fillColor: customStyle.fillColor,
      filled: customStyle.filled,
      floatingLabelBehavior: customStyle.floatingLabelBehavior,
      floatingLabelStyle: customStyle.floatingLabelStyle,
      focusColor: customStyle.focusColor,
      focusedBorder: customStyle.focusedBorder,
      focusedErrorBorder: customStyle.focusedErrorBorder,
      helperMaxLines: customStyle.helperMaxLines,
      helperStyle: customStyle.helperStyle,
      helperText: customStyle.helperText,
      hintMaxLines: customStyle.hintMaxLines,
      hintStyle: customStyle.hintStyle,
      hintText: customStyle.hintText,
      hintTextDirection: customStyle.hintTextDirection,
      hoverColor: customStyle.hoverColor,
      icon: customStyle.icon,
      iconColor: customStyle.iconColor,
      isCollapsed: customStyle.isCollapsed,
      isDense: customStyle.isDense,
      label: customStyle.label,
      labelStyle: customStyle.labelStyle,
      labelText: customStyle.labelText,
      prefix: customStyle.prefix,
      prefixIcon: customStyle.prefixIcon,
      prefixIconColor: customStyle.prefixIconColor,
      prefixIconConstraints: customStyle.prefixIconConstraints,
      prefixStyle: customStyle.prefixStyle,
      prefixText: customStyle.prefixText,
      semanticCounterText: customStyle.semanticCounterText,
      suffix: customStyle.suffix,
      suffixIcon: customStyle.suffixIcon,
      suffixIconColor: customStyle.suffixIconColor,
      suffixIconConstraints: customStyle.suffixIconConstraints,
      suffixStyle: customStyle.suffixStyle,
      suffixText: customStyle.suffixText,
    );
  }
}
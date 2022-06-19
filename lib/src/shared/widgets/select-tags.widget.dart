import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class SelectTags extends StatefulWidget {
  const SelectTags({Key? key, required this.onTagChange}) : super(key: key);
  final Function(Set<String>) onTagChange;

  @override
  State<SelectTags> createState() => _SelectTagsState();
}

class _SelectTagsState extends State<SelectTags> {
  final listOfAvailableTags = ['picante', 'bang', 'crippin'];
  final List<int> selectedTagsIndex = [];

  void handleCategorySelect(int categoryIndex) {
    final newTags =
        selectedTagsIndex.map((index) => listOfAvailableTags[index]).toSet();
    widget.onTagChange(newTags);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChipList(
            extraOnToggle: handleCategorySelect,
            listOfChipNames: listOfAvailableTags,
            supportsMultiSelect: true,
            style: Styles.getRegularTextStyle(),
            inactiveTextColorList: const [Colors.orangeAccent],
            activeBgColorList: const [Colors.orangeAccent],
            listOfChipIndicesCurrentlySeclected: selectedTagsIndex),
        const Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            message: "Prompt Tags",
            preferBelow: false,
            child: Icon(
              Icons.help,
              color: Colors.white,
            ))
      ],
    );
  }
}

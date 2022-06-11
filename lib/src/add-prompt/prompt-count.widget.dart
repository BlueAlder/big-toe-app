import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../shared/styles.dart';
import '../services/prompt.service.dart';

class PromptCount extends StatelessWidget {
  PromptCount({Key? key}) : super(key: key);

  final promptService = GetIt.I.get<PromptService>();

  Text getTextWidget(String message) {
    return Text(message, style: Styles.getRegularTextStyle().copyWith(fontSize: 16));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: promptService.getStatsSnapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.exists) {
              return getTextWidget("We got ${snapshot.data['count']} prompts");
            } else {
              return  getTextWidget("Wow no prompts here...");
            }
          } else if (snapshot.hasError) {
            return  getTextWidget(
                "There are a lot of prompts, probs like at least 4");
          } else {
            debugPrint(snapshot.toString());
            return Container();
          }
        });
  }
}

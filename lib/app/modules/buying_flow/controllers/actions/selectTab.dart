import 'package:flutter/cupertino.dart';

import '../../../../../domain/models/storyCategory.dart';
import '../states.dart';

mixin SelectTabAction {
  void selectTab(ValueNotifier<StoryCategory> selected) {
    tabController!.animateTo(tabsData.indexOf(selected));
    selected.value = selected.value.copyWith(isSelected: true);
    for (var element in tabsData) {
      if (element.value.name != selected.value.name) {
        element.value = element.value.copyWith(isSelected: false);
      }
    }
  }
}

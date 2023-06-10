import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../domain/models/storyCategory.dart';
import '../../../../mainStances.dart';

ValueNotifier<String> pageStates = ValueNotifier('loading');
late TabController? tabController;
final ScrollController scrollController = ScrollController();
late List<ValueNotifier<StoryCategory>> tabsData;
List<StoryCategory> storyCategories = [];

init() {
  scrollController.addListener(() {
    if (scrollController.offset < 300) {
      MainStances.customAppBarStateBottonEmable.value = false;
    } else {
      MainStances.customAppBarStateBottonEmable.value = true;
    }
  });
  tabsData = [
    ValueNotifier(
        StoryCategory(name: 'Padaria', productList: [], isSelected: true)),
    ValueNotifier(
        StoryCategory(name: 'Bebidas', productList: [], isSelected: false)),
    ValueNotifier(
        StoryCategory(name: 'Carnes', productList: [], isSelected: false)),
    ValueNotifier(
        StoryCategory(name: 'Hortifruti', productList: [], isSelected: false)),
    ValueNotifier(
        StoryCategory(name: 'Higiene', productList: [], isSelected: false)),
    ValueNotifier(
        StoryCategory(name: 'Limpeza', productList: [], isSelected: false)),
  ];
}

get getTabName => (element) => element.value.name;

disposeStates() {
  pageStates.dispose();
  for (var element in tabsData) {
    element.dispose();
  }
}

push(String state) {
  pageStates.value = state;
}

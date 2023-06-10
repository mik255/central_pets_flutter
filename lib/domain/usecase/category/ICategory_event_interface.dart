abstract class CategoryDataState {}

class CategorySuccessState extends CategoryDataState {}

class CategoryLoadingState extends CategoryDataState {}

class CategoryErrorState extends CategoryDataState {
  final String? msg;

  CategoryErrorState({required this.msg});
}

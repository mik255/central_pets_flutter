import '../mocks.dart';
import '../states.dart';

class GetCategoriesAction {
  Future<void> getCategories() async {
    Mocks mocks = Mocks();
    try {
      push('loading');
      await Future.delayed(const Duration(seconds: 2));
      storyCategories = mocks.storyCategoryMock();
      push('story');
    } catch (e) {
      throw Exception(e);
    }
  }
}

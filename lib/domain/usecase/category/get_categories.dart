import '../../models/category.dart';
import '../../repository/remote/category_repository.dart';

class CategoryUsecase {
  final ICategoryRepository categoryRepository;

  CategoryUsecase({
    required this.categoryRepository,
  });

  Future<List<Category>> call(String email, String password) async {
    try {
      final data = await categoryRepository.getCategories();
      return data.map((e) => Category.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

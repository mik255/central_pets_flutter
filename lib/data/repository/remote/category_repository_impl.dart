import '../../../domain/repository/remote/category_repository.dart';

class CategoryRepositoryImpl implements ICategoryRepository {
  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      final data = [
        {
          'id': '1',
          'image': 'Teste',
          'description': 'Teste',
        }
      ];
      return data;
    } catch (e) {
      rethrow;
    }
  }
}

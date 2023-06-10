import '../../repository/local/localRepository.dart';

class GetUserFromLocalUserCase {
  GetUserFromLocalUserCase({
    required this.iLocalRepository,
  });

  final ILocalRepository iLocalRepository;

  Future<String?> call() async {
    final data = await iLocalRepository.get('user');
    if (data == null) {
      throw Exception('User not found');
    }
    return data;
  }
}


import 'package:event_driver_arch/domain/models/user.dart';

import '../../repository/local/localRepository.dart';

class SetUserToLocalUserCase {
  SetUserToLocalUserCase({
    required this.iLocalRepository,
  });

  final ILocalRepository iLocalRepository;

  Future<bool> call(String user) async {
    final data = await iLocalRepository.set('user',user);
    if (!data) {
      throw Exception('not can set user');
    }
    return data;
  }
}

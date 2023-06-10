import 'package:event_driver_arch/domain/usecase/config/getConfig.dart';
import 'package:event_driver_arch/mainStances.dart';

import '../../repository/local/localRepository.dart';

class SetConfigUseCase {
  SetConfigUseCase({
    required this.iLocalRepository,
  });

  final ILocalRepository iLocalRepository;

  Future<bool> call(String configEncoded, bool force) async {
    Future<bool> setConfig() async {
      final isSuccess = await iLocalRepository.set('config', configEncoded);
      if (isSuccess == false) {
        throw 'can not set config';
      }
      MainStances.logger.v('config put with success');
      return isSuccess;
    }

    if (force) {
      return await setConfig();
    }
    try {
      final getUser = GetConfigUseCase(iLocalRepository: iLocalRepository);
      getUser();
      return true;
    } catch (e, _) {
      MainStances.logger.i(e.toString());
      MainStances.logger.i('try set config');
      return await setConfig();
    }
  }
}

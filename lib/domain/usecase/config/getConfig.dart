import '../../repository/local/localRepository.dart';

class GetConfigUseCase{
  GetConfigUseCase({
    required this.iLocalRepository,
  });
  final ILocalRepository iLocalRepository;
  String? call(){
      final data = iLocalRepository.get('config');
      if(data == null){
        throw 'Config not found';
      }
      return data;
  }
}
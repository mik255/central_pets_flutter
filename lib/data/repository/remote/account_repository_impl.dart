import 'package:event_driver_arch/app/models/credentials.dart';
import 'package:event_driver_arch/data/mapper/user/credentialsMapper.dart';

import '../../../app/models/user.dart';
import '../../../domain/http/abstract_http.dart';
import '../../../domain/models/account.dart';
import '../../../domain/models/credentials.dart';
import '../../../domain/repository/remote/account_repository.dart';


class AccountRepositoryImpl implements IAccountRepository {
  IHttpClient httpClient;
  AccountRepositoryImpl({required this.httpClient});
  @override
  Future<Account> login(Credentials credentials) async {
    HttpResponse response = await httpClient.post(HttpRequest(route: '/login', body: credentials.toJson()));
    return Account.fromJson(response.data);
  }

  @override
  void loginOut() {
    // TODO: implement loginOut
  }

  @override
  Future<HttpResponse> register(User user) async{
    user.credentials.isValidPassword();
    user.credentials.isValidPassword();
    HttpResponse response = await httpClient.post(HttpRequest(route: '/register',
        body: {}));
    return response;
  }



}

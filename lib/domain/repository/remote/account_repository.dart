import 'package:event_driver_arch/domain/http/abstract_http.dart';
import '../../../app/models/credentials.dart';
import '../../../app/models/user.dart';
import '../../models/account.dart';
import '../../models/credentials.dart';

abstract class IAccountRepository{
  Future<Account> login(Credentials credentials);
  void loginOut();
  Future<HttpResponse> register(User user);
}

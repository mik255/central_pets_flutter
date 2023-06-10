import 'package:event_driver_arch/app/modules/account/login/page/login_page.dart';
import 'package:event_driver_arch/mainStances.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/repository/remote/account_repository_impl.dart';
import 'login_view_model.dart';

var accountPageController = PageController(initialPage: 0);
class AccountPageBuilder extends StatelessWidget {
  const AccountPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<LoginViewModel>(
        create: (_) => LoginViewModel(
          accountRepository: AccountRepositoryImpl(
            httpClient: MainStances.httpClient,
          ),
        ),
      ),
    ], child: PageView(
      controller: accountPageController,
      children:  [
        LoginPage(),
      ],
    ));
  }
}

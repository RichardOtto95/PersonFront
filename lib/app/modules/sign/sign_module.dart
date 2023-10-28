import 'package:soteria/app/modules/sign/sign_Page.dart';
import 'package:soteria/app/modules/sign/sign_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'verify_page.dart';

class SignModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SignPage()),
    ChildRoute('/verify',
        child: (_, args) => const VerifyPage(phoneNumber: "61999999999")),
  ];
}

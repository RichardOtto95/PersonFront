// ignore: implementation_import
import 'package:soteria/app/core/modules/root/root_Page.dart';
import 'package:soteria/app/core/modules/root/root_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:soteria/app/modules/main/main_module.dart';
import 'package:soteria/app/modules/quests/quests_module.dart';
import 'package:soteria/app/modules/sign/sign_module.dart';

import '../../../modules/home/home_module.dart';

class RootModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RootStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RootPage()),
    ModuleRoute("/main", module: MainModule()),
    ModuleRoute("/sign", module: SignModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/quests", module: QuestsModule()),
  ];
}

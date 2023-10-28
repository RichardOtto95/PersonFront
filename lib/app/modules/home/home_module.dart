import 'package:soteria/app/modules/home/home_Page.dart';
import 'package:soteria/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:soteria/app/modules/home/widgets/rules_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage(withResult: args.data)),
    ChildRoute('/rules', child: (_, args) => const RulesPage()),
  ];
}

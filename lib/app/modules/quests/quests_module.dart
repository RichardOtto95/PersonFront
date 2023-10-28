import 'package:soteria/app/modules/quests/quests_Page.dart';
import 'package:soteria/app/modules/quests/quests_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:soteria/app/modules/quests/widgets/calculating_page.dart';
import 'package:soteria/app/modules/quests/widgets/results_page.dart';

import 'widgets/quest_page.dart';

class QuestsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => QuestsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const QuestsPage()),
    ChildRoute('/quest', child: (_, args) => const QuestPage()),
    ChildRoute('/calculating', child: (_, args) => const CalculatingPage()),
    ChildRoute('/results',
        child: (_, args) => ResultsPage(concluded: args.data!)),
  ];
}

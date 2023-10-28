import 'package:mobx/mobx.dart';

part 'quests_store.g.dart';

class QuestsStore = _QuestsStoreBase with _$QuestsStore;
abstract class _QuestsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}
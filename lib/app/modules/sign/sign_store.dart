import 'package:mobx/mobx.dart';

part 'sign_store.g.dart';

class SignStore = _SignStoreBase with _$SignStore;
abstract class _SignStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}
import 'chihuahua.dart';
import 'doberman.dart';

class Dog {
  factory Dog.createDog(String nome, bool caoGuarda) {
    if (caoGuarda) {
      return Doberman();
    }
    return Chihuahua();
  }

  Dog();
}

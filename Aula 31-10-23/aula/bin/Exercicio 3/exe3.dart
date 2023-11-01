import 'chihuahua.dart';
import 'doberman.dart';
import 'dog.dart';

void main() {
  Dog cao = Dog.createDog('Rex', true);
  if (cao is Doberman) {
    print('É Doberman');
  } else if (cao is Chihuahua) {
    print('É Chihuahua');
  } else {
    print('Erro');
  }
}

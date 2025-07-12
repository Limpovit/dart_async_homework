import 'dart:io';
import 'dart:math';

void main(List<String> args) async{

  final random = Random();

 final iterableList = List.generate(5, (_) => random.nextInt(6));
  
final Stream<int> stream = Stream.fromIterable(iterableList);

await for (var value in stream) {
  stdout.write("$value ");
  await Future.delayed(const Duration(milliseconds: 100));
}
stdout.write("\n");

stream.listen((value) {
  stdout.write("$value ");
});

}

// Task 6: Стрім з чисел (fromIterable)

// Створіть Stream<int> з довільних чисел (наприклад, від 1 до 5) за допомогою Stream.fromIterable.
// Виведіть кожне значення з цього стріму, використовуючи конструкцію await for.
// Виведіть кожне значення з цього ж стріму, використовуючи метод listen.


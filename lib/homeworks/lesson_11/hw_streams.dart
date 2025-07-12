import 'dart:async';
import 'dart:io';
import 'dart:math';

void main(List<String> args) async {
  await streamFromIterable();

  await periodicStream();

  await streamController();
}

Future<void> streamFromIterable() async {
  // Task 6: Стрім з чисел (fromIterable)

  // Створіть Stream<int> з довільних чисел (наприклад, від 1 до 5) за допомогою Stream.fromIterable.
  // Виведіть кожне значення з цього стріму, використовуючи конструкцію await for.
  // Виведіть кожне значення з цього ж стріму, використовуючи метод listen.

  final random = Random();

  final iterableList = List.generate(5, (_) => random.nextInt(6));

  final Stream<int> stream = Stream.fromIterable(iterableList);

  await for (var value in stream) {
    stdout.write('$value ');
    await Future.delayed(const Duration(milliseconds: 100));
  }
  stdout.write('\n');

  stream.listen((value) {
    stdout.write('$value ');
  });
}

Future<void> periodicStream() async {
  //   Task 7: Зворотний відлік зі стріму (periodic)

  // Створіть Stream<int> за допомогою Stream.periodic, який генерує числа з затримкою в 1 секунду.
  // Обмежте відлік до 10 чисел за допомогою методу take.
  // Виведіть кожне число у консоль у форматі: "1...", "2...", "3...", ... "10...".

  final Stream streamPeriodic = Stream.periodic(
    const Duration(milliseconds: 1),
    (timer) {
      return timer + 1;
    },
  ).take(10);

  await for (var value in streamPeriodic) {
    stdout.write('$value...');
  }
}

Future<void> streamController() async {
  //   Task 8: Робота з StreamController

  // Створіть StreamController<String>.
  // Додайте до цього контролера кілька довільних рядкових значень вручну (наприклад, "Hello", "World", "Dart").
  // Прослухайте цей стрім (через метод listen) і виведіть всі значення у консоль.
  // Закрийте контролер після додавання всіх значень.

  stdout.write('\n');

  final controller = StreamController<String>();

  controller.stream.listen((event) {
    stdout.write('$event ');
  });

  controller.add('Hello');
  controller.add('World');
  controller.add('Dart');

  await controller.close();
}

import 'dart:io';

void main(List<String> args) async {

  // Task 1: Асинхронне отримання імені
  stdout.write("Мене звати ${await fetchName()}");

}

// Task 1: Асинхронне отримання імені

// Створіть метод Future<String> fetchName(), який імітує асинхронну операцію.
// Цей метод повинен повертати ваше ім'я через 2 секунди (використайте Future.delayed та async/await).
// Виведіть результат у консоль у форматі: "Мене звати [результат виконання асинхронної операції]".

Future<String> fetchName() async {
  return await Future.delayed(
    const Duration(seconds: 2),
    () => "Vitalii Lymar",
  );
}

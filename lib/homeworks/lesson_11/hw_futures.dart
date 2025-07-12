import 'dart:io';

void main(List<String> args) async {

  // Task 1: Асинхронне отримання імені
  stdout.write("Мене звати ${await fetchName()}");

  // Task 2: Асинхронне отримання віку
  stdout.write("\nМені ${pluralizeYears(await fetchAge())}");

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

// Task 2: Асинхронне отримання віку

// Створіть метод Future<String> fetchAge(), який імітує асинхронну операцію.
// Цей метод повинен повертати рядок "25" через 1500 мілісекунд.
// Виведіть результат у консоль у форматі: "Мені [ваш вік] років".
// Реалізуйте логіку, щоб слово "рік" змінювалося відповідно до значення віку (наприклад: 21 рік, 22 роки, 25 років).

Future<String> fetchAge() async {

  return await Future.delayed(const Duration(milliseconds: 1500), () => "1");

}

String pluralizeYears(String ageStr) {

 if (ageStr.isEmpty) return "Невірне значення";

  int age = int.tryParse(ageStr) ?? -1;
  if (age < 0) return "Невірне значення";

  String lastChar = ageStr[ageStr.length - 1];
  String lastTwo = ageStr.length >= 2
      ? ageStr.substring(ageStr.length - 2)
      : lastChar;

  if (lastTwo == '11' || lastTwo == '12' || lastTwo == '13' || lastTwo == '14') {
    return "$ageStr років";
  }

  switch (lastChar) {
    case '1':
      return "$ageStr рік";
    case '2':
    case '3':
    case '4':
      return "$ageStr роки";
    default:
      return "$ageStr років";
  }
}
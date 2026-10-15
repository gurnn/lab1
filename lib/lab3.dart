import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(),
    );
  }
}

class CardData {
  final String title;
  final String description;
  final String image;

  const CardData({
    required this.title,
    required this.description,
    required this.image,
  });
}

const List<CardData> cars = [
  CardData(
    title: 'Mercedes-Benz W204',
    description: 'Дорест • Седан',
    image: 'assets/images/car1.jpg',
  ),
  CardData(
    title: 'BMW F10',
    description: 'Рестайлинг • Седан',
    image: 'assets/images/car2.jpg',
  ),
  CardData(
    title: 'BMW F20',
    description: 'Дорест • Хетчбэк\nПравый руль',
    image: 'assets/images/car3.jpg',
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Автомобили — ЛР 3'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 16),
        children: cars
            .map((car) => CarCard.fromData(car))
            .toList(),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const CarCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  factory CarCard.fromData(CardData data) {
    return CarCard(
      title: data.title,
      description: data.description,
      image: data.image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              width: 110,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.directions_car, size: 26),
        ],
      ),
    );
  }
}
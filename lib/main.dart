
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
  final String details;

  const CardData({
    required this.title,
    required this.description,
    required this.image,
    required this.details,
  });
}

const List<CardData> cars = [
  CardData(
    title: 'Mercedes-Benz W204',
    description: 'Дорест • Седан',
    image: 'assets/images/car1.jpg',
    details: 'Mercedes-Benz C-класса в кузове W204.\n'
        'Дорестайлинговая версия, кузов — седан.',
  ),
  CardData(
    title: 'BMW F10',
    description: 'Рестайлинг • Седан',
    image: 'assets/images/car2.jpg',
    details: 'BMW 5-й серии в кузове F10.\n'
        'Рестайлинговая версия, кузов — седан.',
  ),
  CardData(
    title: 'BMW F20',
    description: 'Дорест • Хетчбэк\nПравый руль',
    image: 'assets/images/car3.jpg',
    details: 'BMW 1-й серии в кузове F20.\n'
        'Дорестайлинговая версия, пятидверный хетчбэк.\n'
        'С правым рулём из Японии.',
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ЛР 4 — Автомобили'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 16),
        children: cars.map((car) => CarCard(data: car)).toList(),
      ),
    );
  }
}

class CarCard extends StatefulWidget {
  final CardData data;

  const CarCard({
    super.key,
    required this.data,
  });

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isLiked
              ? 'Лайк поставлен: ${widget.data.title}'
              : 'Лайк убран: ${widget.data.title}',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarDetailsPage(
          data: widget.data,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.grey),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: openDetails,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.data.image,
                    width: 100,
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
                        widget.data.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.data.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: toggleLike,
                  tooltip: isLiked
                      ? 'Убрать лайк'
                      : 'Поставить лайк',
                  icon: Icon(
                    isLiked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  final CardData data;

  const CarDetailsPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                data.image,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              data.description,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Описание автомобиля',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              data.details,
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

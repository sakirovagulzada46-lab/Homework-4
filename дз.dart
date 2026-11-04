import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragCircleScreen(),
    );
  }
}

class DragCircleScreen extends StatefulWidget {
  const DragCircleScreen({super.key});

  @override
  State<DragCircleScreen> createState() => _DragCircleScreenState();
}

class _DragCircleScreenState extends State<DragCircleScreen> {
  // Начальные координаты круга (будут установлены по центру экрана)
  double? posX;
  double? posY;

  @override
  Widget build(BuildContext context) {
    // Получаем размеры экрана, чтобы вычислить точный центр
    final screenSize = MediaQuery.of(context).size;
    
    // Если координаты еще не заданы, ставим круг ровно по центру
    posX ??= screenSize.width / 2 - 40; // 40 — это половина ширины круга (радиус)
    posY ??= screenSize.height / 2 - 40;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Перетаскивание круга'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Positioned(
            left: posX,
            top: posY,
            child: GestureDetector(
              // Метод вызывается, когда пользователь двигает палец по экрану
              onPanUpdate: (details) {
                setState(() {
                  // Обновляем координаты с учетом движения пальца
                  posX! += details.delta.dx;
                  posY! += details.delta.dy;
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle, // Делает контейнер кругом
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
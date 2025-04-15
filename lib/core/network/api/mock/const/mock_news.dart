import 'package:project_z/core/domain/entity/news/news.dart';

final mockNews = NewsList(
  count: 2,
  next: null,
  previous: null,
  results: [
    News(
      id: 1,
      image: 'https://example.com/news1.jpg',
      // Основное изображение
      mobileImage: 'https://i.ibb.co/bRKnNfzB/1-2.png',
      // Мобильное изображение
      createdAt: DateTime.parse('2025-03-01T10:00:00Z'),
      updatedAt: DateTime.parse('2025-03-01T10:00:00Z'),
    ),
    News(
      id: 2,
      image: 'https://example.com/news2.jpg',
      // Основное изображение
      mobileImage: 'https://i.ibb.co/bRKnNfzB/1-2.png',
      // Мобильное изображение
      createdAt: DateTime.parse('2025-03-02T12:30:00Z'),
      updatedAt: DateTime.parse('2025-03-02T14:45:00Z'),
    ),
  ],
);
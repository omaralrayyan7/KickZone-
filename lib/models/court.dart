class Court {
  final String id;
  final String name;
  final String type; // 'indoor' or 'outdoor'
  final double pricePerHour;
  final String imageUrl;
  final int maxCapacity;

  const Court({
    required this.id,
    required this.name,
    required this.type,
    required this.pricePerHour,
    required this.imageUrl,
    required this.maxCapacity,
  });

  static const List<Court> indoorCourts = [
    Court(
      id: 'jubaiba',
      name: 'Jubaiba',
      type: 'indoor',
      pricePerHour: 17.5,
      imageUrl:
          'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=400&fit=crop',
      maxCapacity: 20,
    ),
    Court(
      id: 'daboug',
      name: 'Daboug',
      type: 'indoor',
      pricePerHour: 17.5,
      imageUrl:
          'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=400&fit=crop',
      maxCapacity: 20,
    ),
    Court(
      id: 'abu-nasir',
      name: 'Abu Nasir',
      type: 'indoor',
      pricePerHour: 17.5,
      imageUrl:
          'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400&fit=crop',
      maxCapacity: 20,
    ),
    Court(
      id: 'abdoun',
      name: 'Abdoun',
      type: 'indoor',
      pricePerHour: 20.0,
      imageUrl:
          'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=400&fit=crop',
      maxCapacity: 22,
    ),
    Court(
      id: 'sweich',
      name: 'Sweich',
      type: 'indoor',
      pricePerHour: 17.5,
      imageUrl:
          'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=400&fit=crop',
      maxCapacity: 20,
    ),
    Court(
      id: 'khalda',
      name: 'Khalda',
      type: 'indoor',
      pricePerHour: 17.5,
      imageUrl:
          'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400&fit=crop',
      maxCapacity: 20,
    ),
  ];

  static const List<Court> outdoorCourts = [
    Court(
      id: 'sport-city',
      name: 'Sport City',
      type: 'outdoor',
      pricePerHour: 12.0,
      imageUrl:
          'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=400&fit=crop',
      maxCapacity: 22,
    ),
    Court(
      id: 'mecca-mall',
      name: 'Mecca Mall',
      type: 'outdoor',
      pricePerHour: 12.0,
      imageUrl:
          'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=400&fit=crop',
      maxCapacity: 22,
    ),
    Court(
      id: 'jubaiha-outdoor',
      name: 'Jubaiha',
      type: 'outdoor',
      pricePerHour: 10.0,
      imageUrl:
          'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=400&fit=crop',
      maxCapacity: 22,
    ),
    Court(
      id: 'zarqa',
      name: 'Zarqa',
      type: 'outdoor',
      pricePerHour: 10.0,
      imageUrl:
          'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=400&fit=crop',
      maxCapacity: 22,
    ),
  ];
}

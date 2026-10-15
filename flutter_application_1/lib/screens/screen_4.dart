import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    final dishes = [
      {'title': 'Original S...', 'subtitle': 'Lovy Food', 'price': '\$8', 'image': 'assets/dish_original.png'},
      {'title': 'Fresh Salad', 'subtitle': 'Cloudy Resto', 'price': '\$10', 'image': 'assets/dish_salad.png'},
      {'title': 'Yummie Ice Cream', 'subtitle': 'Circlo Resto', 'price': '\$6', 'image': 'assets/dish_icecream.png'},
      {'title': 'Vegan Special', 'subtitle': 'Haty Food', 'price': '\$11', 'image': 'assets/dish_vegan.png'},
      {'title': 'Mixed Pasta', 'subtitle': 'Recto Food', 'price': '\$13', 'image': 'assets/dish_pasta.png'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/status_bar.png', width: double.infinity),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                children: [
                  const Text(
                    '21_Light_Popular Menu',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDE8EC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                          color: Color(0xFFE85D75),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Popular Menu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              icon: Icon(Icons.search, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDE8EC),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Color(0xFFE85D75),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...dishes.map((dish) => _dishCard(dish)).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavItem(icon: Icons.home, label: 'Home', selected: true),
            _NavItem(icon: Icons.favorite_border, label: ''),
            _NavItem(icon: Icons.chat_bubble_outline, label: ''),
            _NavItem(icon: Icons.person_outline, label: ''),
          ],
        ),
      ),
    );
  }

  Widget _dishCard(Map<String, String> dish) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              dish['image']!,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dish['subtitle']!,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            dish['price']!,
            style: const TextStyle(
              color: Color(0xFFE85D75),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  const _NavItem({required this.icon, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
            color: selected ? const Color(0xFFE85D75) : Colors.grey, size: 22),
        if (label.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(label,
              style: const TextStyle(
                  color: Color(0xFFE85D75), fontWeight: FontWeight.bold)),
        ],
      ],
    );
  }
}
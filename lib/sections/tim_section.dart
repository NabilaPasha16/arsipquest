import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../widgets/common_widgets.dart';

class TimSection extends StatelessWidget {
  final bool visible;

  const TimSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      visible: visible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 60),
        child: Column(
          children: [
            Text(
              'Tim Kami',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBrown,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Tim kreatif yang menggabungkan sejarah, strategi, dan teknologi menjadi pengalaman bermain yang imersif.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.navy.withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 880;
                final crossAxisCount =
                    isMobile ? 1 : (constraints.maxWidth < 1200 ? 2 : 3);

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  children: const [
                    _TeamMemberCard(
                      name: 'Nabila Pasha Hamidah',
                      image: '👩‍💼',
                    ),
                    _TeamMemberCard(
                      name: 'Oktavia Rahma Widjianti',
                      image: '👩‍🎨',
                    ),
                    _TeamMemberCard(
                      name: 'Sukma Dwi Pangesti',
                      image: '👩‍💻',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamMemberCard extends StatefulWidget {
  final String name;
  final String image;

  const _TeamMemberCard({
    required this.name,
    required this.image,
  });

  @override
  State<_TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<_TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -8 : 0,
          0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppColors.softStone.withOpacity(0.95),
          border: Border.all(
            color: AppColors.gold.withOpacity(0.15),
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.shadow.withOpacity(0.25)
                  : AppColors.shadow.withOpacity(0.1),
              blurRadius: _isHovered ? 24 : 14,
              offset: Offset(0, _isHovered ? 12 : 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.image,
                style: const TextStyle(fontSize: 70),
              ),
              const SizedBox(height: 20),
              Text(
                widget.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBrown,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
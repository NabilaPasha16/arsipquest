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
                color:
                    Theme.of(context).textTheme.displaySmall?.color ??
                    Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Tim kreatif yang menggabungkan sejarah, strategi, dan teknologi menjadi pengalaman bermain yang imersif.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyLarge?.color?.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 880;
                final crossAxisCount = isMobile
                    ? 1
                    : (constraints.maxWidth < 1200 ? 2 : 3);

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.82,
                  children: const [
                    _TeamMemberCard(
                      name: 'Nabila Pasha Hamidah',
                      image: 'assets/Nabila Pasha.jpeg',
                    ),
                    _TeamMemberCard(
                      name: 'Oktavia Rahma Widjianti',
                      image: 'assets/Oktavia Rahma.jpg',
                    ),
                    _TeamMemberCard(
                      name: 'Sukma Dwi Pangesti',
                      image: 'assets/Sukma Dwi.jpeg',
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
          _isHovered ? -10 : 0,
          0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withOpacity(0.55),
          border: Border.all(
            color: Colors.white.withOpacity(0.35),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.gold.withOpacity(0.35)
                  : Colors.black.withOpacity(0.08),
              blurRadius: _isHovered ? 40 : 20,
              spreadRadius: _isHovered ? 4 : 0,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: _isHovered ? 1.12 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isHovered
                          ? AppColors.darkBrown
                          : AppColors.gold,
                      width: _isHovered ? 5 : 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gold.withOpacity(
                          _isHovered ? 0.35 : 0.15,
                        ),
                        blurRadius: _isHovered ? 35 : 15,
                        spreadRadius: _isHovered ? 5 : 1,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Text(
                widget.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).textTheme.titleLarge?.color ??
                      Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Container(
                width: 90,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gold.withOpacity(0.2),
                      AppColors.gold,
                      AppColors.gold.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
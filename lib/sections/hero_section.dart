import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../widgets/common_widgets.dart';

class HeroSection extends StatelessWidget {
  final bool visible;
  final void Function(String) onCtaTap;

  const HeroSection({super.key, required this.visible, required this.onCtaTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      visible: visible,
      child: Container(
        constraints: const BoxConstraints(minHeight: 700),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 900;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.accentRed.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Text(
                          'Board Game Edukasi • AR • Sejarah Indonesia',
                          style: TextStyle(color: AppColors.accentRed, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'ARSIP QUEST',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: AppColors.navy,
                              letterSpacing: 1.2,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'The Living Archive',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.accentRed),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Sejarah bukan hafalan, tapi petualangan! Gabungkan strategi, eksplorasi, dan AR untuk mengenal situs bersejarah Indonesia dengan cara yang mengesankan.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          ElevatedButton(
                            onPressed: () => onCtaTap('Kontak'),
                            child: const Text('Mainkan Sekarang'),
                          ),
                          OutlinedButton(
                            onPressed: () => onCtaTap('Harga'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.darkBrown,
                              side: const BorderSide(color: AppColors.darkBrown),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                            ),
                            child: const Text('Lihat Produk'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (!isMobile) const SizedBox(width: 20),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: IntrinsicHeight(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 40,
                            top: 60,
                            child: _DecorativeCard(
                              label: 'AR Card',
                              icon: Icons.qr_code_2_rounded,
                              color: AppColors.gold.withValues(alpha: 0.15),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 50,
                            child: _DecorativeCard(
                              label: 'Kartu Sejarah',
                              icon: Icons.auto_stories_rounded,
                              color: AppColors.accentRed.withValues(alpha: 0.14),
                            ),
                          ),
                          CircleAvatar(
                            radius: 135,
                            backgroundColor: AppColors.softStone,
                            child: Container(
                              width: 250,
                              height: 320,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                gradient: const LinearGradient(
                                  colors: [AppColors.navy, AppColors.darkBrown],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow,
                                    blurRadius: 40,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Mockup Produk',
                                      style: TextStyle(
                                        color: AppColors.parchment,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Papan permainan, kartu, uang permainan, dan AR QR',
                                      style: TextStyle(color: AppColors.parchment, height: 1.4),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DecorativeCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _DecorativeCard({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.navy, size: 28),
          const SizedBox(height: 18),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.navy, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

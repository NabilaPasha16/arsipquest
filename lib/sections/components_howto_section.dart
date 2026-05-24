import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/app_models.dart';
import '../widgets/common_widgets.dart';

class ComponentsSection extends StatelessWidget {
  final bool visible;

  const ComponentsSection({super.key, required this.visible});

  static const components = [
    ComponentItem(title: 'Papan permainan', icon: Icons.map_rounded),
    ComponentItem(title: 'Kartu Situs Sejarah', icon: Icons.book_rounded),
    ComponentItem(title: 'Kartu Arsip Rahasia', icon: Icons.lock_rounded),
    ComponentItem(
      title: 'Kartu Kejadian Sejarah',
      icon: Icons.history_edu_rounded,
    ),
    ComponentItem(title: 'Lembar Literasi', icon: Icons.description_rounded),
    ComponentItem(title: 'QR AR Cards', icon: Icons.qr_code_2_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      visible: visible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Komponen Permainan',
              subtitle: 'Setiap elemen dirancang untuk cerita',
              description:
                  'Simak komponen lengkap ARSIP QUEST yang membantu pemain memahami sejarah lewat permainan visual, taktik, dan AR.',
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 880;
                final cardWidth = isMobile ? constraints.maxWidth - 56 : 260.0;
                return Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: components
                      .map(
                        (item) => HoverFloatCard(
                          child: Container(
                            width: cardWidth,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.softStone,
                              borderRadius: BorderRadius.circular(26),
                              border: Border.all(
                                color: AppColors.gold.withOpacity(0.16),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.navy,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Icon(
                                    item.icon,
                                    color: AppColors.parchment,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    item.title,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          color: AppColors.darkBrown,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HowToPlaySection extends StatelessWidget {
  final bool visible;

  const HowToPlaySection({super.key, required this.visible});

  static const steps = [
    StepItem(step: '1', label: 'Pilih pion'),
    StepItem(step: '2', label: 'Jelajahi situs sejarah'),
    StepItem(step: '3', label: 'Kumpulkan aset'),
    StepItem(step: '4', label: 'Temukan arsip rahasia'),
    StepItem(step: '5', label: 'Gunakan AR'),
    StepItem(step: '6', label: 'Raih kemenangan'),
  ];

  static const stepImages = [
    'assets/pilih_pion.png',
    'assets/jelajahi_situs_sejarah.png',
    'assets/kumpulkan_aset.png',
    'assets/temukan_arsip_rahasia.png',
    'assets/gunakan_ar.png',
    'assets/raih_kemenangan.png',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      visible: visible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Cara Bermain',
              subtitle: 'Langkah demi langkah',
              description:
                  'Ikuti proses permainan ARSIP QUEST agar pengalaman pembelajaran tetap seru, intuitif, dan mudah dimengerti oleh semua usia.',
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 880;
                final cardWidth = isMobile ? constraints.maxWidth - 56 : 220.0;
                return Wrap(
                  spacing: 22,
                  runSpacing: 22,
                  children: List.generate(steps.length, (index) {
                    final item = steps[index];
                    final imagePath = stepImages[index];
                    return HoverFloatCard(
                      child: Container(
                        width: cardWidth,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.parchment,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 18,
                              offset: const Offset(0, 12),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.gold.withOpacity(0.12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imagePath,
                                height: 110,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 46,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: AppColors.navy,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.step,
                                      style: const TextStyle(
                                        color: AppColors.parchment,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    item.label,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: AppColors.darkBrown),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

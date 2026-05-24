import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/app_models.dart';
import '../widgets/common_widgets.dart';

class AboutSection extends StatelessWidget {
  final bool visible;

  const AboutSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      visible: visible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 880;

            // Menggunakan Flex agar bisa berubah dari Row (Desktop) ke Column (Mobile)
            return Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isMobile
                      ? 0
                      : 4, // Jangan gunakan expanded jika mobile agar tidak error height
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(
                        title: 'Tentang Produk',
                        subtitle:
                            'Sejarah Indonesia hadir sebagai petualangan interaktif',
                        description:
                            'ARSIP QUEST menghadirkan pengalaman board game edukatif yang memadukan strategi, eksplorasi, dan teknologi Augmented Reality untuk membawa pemain menjelajahi jejak sejarah Indonesia secara imersif dan menyenangkan.',
                      ),
                      const SizedBox(height: 20),
                      // Perbaikan: Text tidak boleh membungkus SizedBox
                      Text(
                        'Setiap permainan mengajak pemain menelusuri situs bersejarah Nusantara, mengungkap arsip tersembunyi, dan menghadapi tantangan strategi yang membuat proses belajar terasa hidup, visual, dan penuh eksplorasi.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.darkBrown.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isMobile)
                  const SizedBox(width: 32)
                else
                  const SizedBox(height: 32),

                // Bagian Kartu "Menghidupkan Jejak Sejarah"
                Expanded(
                  flex: isMobile ? 0 : 3,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.navy,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.gold.withOpacity(0.18),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Menghidupkan Jejak Sejarah',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.parchment,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Rasakan perpaduan board game, elemen budaya Indonesia, dan teknologi AR yang menghadirkan pengalaman belajar sejarah secara modern dan berkesan.',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.parchment.withOpacity(0.9),
                              ),
                        ),
                      ],
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

class FeatureSection extends StatelessWidget {
  final bool visible;

  const FeatureSection({super.key, required this.visible});

  static const List<FeatureItem> features = [
    FeatureItem(
      icon: Icons.school_rounded,
      title: 'Edukatif dan Interaktif',
      description:
          'Memperkuat pengetahuan sejarah melalui permainan kolaboratif.',
    ),
    FeatureItem(
      icon: Icons.visibility_rounded,
      title: 'Berbasis Augmented Reality',
      description:
          'Teknologi AR menghadirkan pengalaman belajar yang lebih visual dan imersif.',
    ),
    FeatureItem(
      icon: Icons.explore_rounded,
      title: 'Situs Bersejarah Indonesia',
      description:
          'Jelajahi berbagai situs budaya dan sejarah Indonesia dalam satu permainan.',
    ),
    FeatureItem(
      icon: Icons.groups_rounded,
      title: 'Kolaborasi dan Strategi',
      description:
          'Bangun kerja sama tim sambil memecahkan tantangan sejarah yang seru.',
    ),
    FeatureItem(
      icon: Icons.person_rounded,
      title: 'Seru untuk Semua Usia',
      description:
          'Dirancang untuk keluarga, pelajar, komunitas, dan aktivitas edukatif.',
    ),
    FeatureItem(
      icon: Icons.workspace_premium_rounded,
      title: 'Desain Premium',
      description:
          'Visual vintage modern dengan komponen permainan yang elegan dan eksklusif.',
    ),
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
              title: 'Keunggulan Produk',
              subtitle: 'Mengapa ARSIP QUEST berbeda?',
              description:
                  'Perpaduan edukasi, strategi permainan, dan teknologi modern menjadikan ARSIP QUEST sebagai pengalaman belajar sejarah yang lebih hidup, kolaboratif, dan menyenangkan.',
            ),
            const SizedBox(height: 32),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 880;
                // Perhitungan lebar kartu yang lebih aman untuk responsive
                final cardWidth = isMobile
                    ? constraints.maxWidth
                    : (constraints.maxWidth - 48) /
                          2.2; // Menampilkan hampir 3 kolom di desktop

                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: features
                      .map(
                        (feature) => SizedBox(
                          width: cardWidth > 340 ? 340 : cardWidth,
                          child: HoverFloatCard(
                            child: FeatureCard(
                              icon: feature.icon,
                              title: feature.title,
                              subtitle: feature.description,
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

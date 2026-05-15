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
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SectionTitle(
                        title: 'Tentang Produk',
                        subtitle: 'Game sejarah bernapas modern vintage',
                        description: 'ARSIP QUEST adalah board game edukatif yang menggabungkan strategi, eksplorasi, dan teknologi AR untuk mengenalkan sejarah Indonesia secara menyenangkan kepada anak-anak dan keluarga.',
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Permainan ini dirancang untuk menciptakan pengalaman belajar aktif dengan peta lokasi bersejarah, kartu arsip rahasia, dan tantangan interaktif yang membuat setiap putaran menjadi petualangan edukatif.',
                        style: TextStyle(height: 1.7),
                      ),
                    ],
                  ),
                ),
                if (!isMobile) const SizedBox(width: 32),
                if (!isMobile)
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColors.softStone,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.gold.withValues(alpha: 0.18)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Menemukan arsip', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                          SizedBox(height: 12),
                          Text('Selami narasi sejarah Indonesia dengan elemen budaya, strategi permainan, dan fitur AR yang menghadirkan rekaman arsip digital di setiap kartu.', textAlign: TextAlign.left),
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

  static const features = [
    FeatureItem(
      icon: Icons.school_rounded,
      title: 'Edukatif dan Interaktif',
      description: 'Memperkuat pengetahuan sejarah melalui permainan kolaboratif.',
    ),
    FeatureItem(
      icon: Icons.visibility_rounded,
      title: 'Berbasis Augmented Reality',
      description: 'Aktifkan pengalaman AR untuk melihat arsip hidup.',
    ),
    FeatureItem(
      icon: Icons.landscape_rounded,
      title: 'Situs Bersejarah Indonesia',
      description: 'Kenali destinasi budaya dari Aceh hingga Papua.',
    ),
    FeatureItem(
      icon: Icons.groups_rounded,
      title: 'Latihan Strategi & Kerja Sama',
      description: 'Bangun rencana tim dan raih kemenangan bersama.',
    ),
    FeatureItem(
      icon: Icons.person_rounded,
      title: '2–4 Pemain',
      description: 'Cocok untuk keluarga, kelas, dan komunitas edukasi.',
    ),
    FeatureItem(
      icon: Icons.child_care_rounded,
      title: 'Usia 10+',
      description: 'Dirancang agar aman dan menarik untuk usia sekolah.',
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
              subtitle: 'Mengapa ARSIP QUEST',
              description: 'Temukan kelebihan permainan yang memadukan histori, teknologi AR, dan pengalaman tabletop premium untuk audiens modern.',
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: features
                  .map(
                    (feature) => SizedBox(
                      width: 340,
                      child: FeatureCard(
                        icon: feature.icon,
                        title: feature.title,
                        subtitle: feature.description,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

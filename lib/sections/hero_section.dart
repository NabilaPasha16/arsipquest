import 'dart:math';
import 'dart:ui'; // Penting: Untuk ImageFilter
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.richBronzeGold,
              AppColors.antiqueGold,
              AppColors.gold,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Overlay gradient halus untuk kedalaman
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.navy.withOpacity(0.04),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // --- Ornamen Dekoratif (Background) ---
            Positioned(
              left: -40,
              top: 80,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: AppColors.lightGold.withOpacity(0.24),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -30,
              bottom: 60,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.antiqueGold.withOpacity(0.22),
                  borderRadius: BorderRadius.circular(80),
                ),
              ),
            ),

            // NOTE: Badge moved into the image column below so it won't overlap
            // the image or other content. See insertion near the image widget.

            // --- Konten Utama ---
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 900;
                final imageWidth = min(
                  520.0,
                  constraints.maxWidth * (isMobile ? 0.8 : 0.48),
                );
                final imageHeight = imageWidth * 0.82;

                return Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Sisi Kiri: Teks & CTA
                    Expanded(
                      flex: isMobile ? 0 : 6,
                      child: Column(
                        crossAxisAlignment: isMobile
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentRed.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Text(
                              'Board Game Edukasi • AR • Sejarah Indonesia',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.parchment,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'ARSIP QUEST',
                            textAlign: isMobile
                                ? TextAlign.center
                                : TextAlign.start,
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(
                                  color: AppColors.parchment,
                                  letterSpacing: 1.2,
                                  fontSize: isMobile ? 48 : null,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'The Living Archive',
                            textAlign: isMobile
                                ? TextAlign.center
                                : TextAlign.start,
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  color: AppColors.parchment,
                                  fontSize: isMobile ? 24 : null,
                                ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Sejarah bukan hafalan, tapi petualangan! Gabungkan strategi, eksplorasi, dan AR untuk mengenal situs bersejarah Indonesia dengan cara yang mengesankan.',
                            textAlign: isMobile
                                ? TextAlign.center
                                : TextAlign.start,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: AppColors.parchment.withOpacity(0.92),
                                ),
                          ),
                          const SizedBox(height: 30),
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            alignment: isMobile
                                ? WrapAlignment.center
                                : WrapAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () => onCtaTap('Kontak'),
                                child: const Text('Mainkan Sekarang'),
                              ),
                              OutlinedButton(
                                onPressed: () => onCtaTap('Harga'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.parchment,
                                  backgroundColor: AppColors.bistre.withOpacity(
                                    0.18,
                                  ),
                                  side: BorderSide(
                                    color: AppColors.parchment.withOpacity(
                                      0.65,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 26,
                                    vertical: 16,
                                  ),
                                ),
                                child: const Text('Lihat Produk'),
                              ),
                            ],
                          ),
                          if (isMobile) const SizedBox(height: 40),
                        ],
                      ),
                    ),

                    if (!isMobile) const SizedBox(width: 40),

                    // Sisi Rantai: Gambar & Kartu Melayang
                    Expanded(
                      flex: isMobile ? 0 : 5,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: imageWidth + 60,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: imageWidth + 60,
                                height: imageHeight + 60,
                                child: Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    HoverFloatCard(
                                      child: Container(
                                        width: imageWidth,
                                        height: imageHeight,
                                        decoration: BoxDecoration(
                                          color: AppColors.parchment,
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.shadow
                                                  .withOpacity(0.3),
                                              blurRadius: 40,
                                              offset: const Offset(0, 20),
                                            ),
                                          ],
                                        ),
                                        padding: const EdgeInsets.all(14),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          child: Image.asset(
                                            'assets/boardgame_design_3.png',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                                      color:
                                                          AppColors.antiqueGold,
                                                      child: const Icon(
                                                        Icons.image,
                                                      ),
                                                    ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),

                              // Caption moved below the image so it doesn't overlap.
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.lightGold.withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.gold.withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  'Petualangan Sejarah • Bermain, Menjelajah, Mengungkap',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.darkBrown,
                                    fontWeight: FontWeight.w700,
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
          ],
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: 130,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(
              0.7,
            ), // Opacity dikurangi agar efek blur terasa
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.navy, size: 24),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

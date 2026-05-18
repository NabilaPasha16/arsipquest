import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/app_models.dart';
import '../widgets/common_widgets.dart';

class GallerySection extends StatelessWidget {
  final bool visible;

  const GallerySection({super.key, required this.visible});

  static const galleryItems = [
    GalleryItem(label: 'Peta Interaktif', color: AppColors.gold),
    GalleryItem(label: 'Kartu AR', color: AppColors.accentRed),
    GalleryItem(label: 'Board Premium', color: AppColors.navy),
    GalleryItem(label: 'Uang Permainan', color: AppColors.darkBrown),
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
              title: 'Galeri Produk',
              subtitle: 'Intip tampilan premium ARSIP QUEST',
              description:
                  'Lihat detail tampilan peta, kartu, dan aset visual yang akan menemani petualangan sejarah Anda.',
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 22,
              runSpacing: 22,
              children: galleryItems
                  .map(
                    (item) => HoverFloatCard(
                      child: Container(
                        width: 240,
                        height: 180,
                        decoration: BoxDecoration(
                          color: item.color.withValues(alpha: 0.95),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 22,
                              offset: const Offset(0, 14),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            item.label,
                            style: const TextStyle(
                              color: AppColors.parchment,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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

class PricingSection extends StatelessWidget {
  final bool visible;

  const PricingSection({super.key, required this.visible});

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
              title: 'Harga dan Paket',
              subtitle: 'Pilihan paket premium',
              description:
                  'Dapatkan paket lengkap ARSIP QUEST dengan harga terbaik untuk pengalaman edukasi dan permainan yang menarik.',
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 22,
              runSpacing: 22,
              children: const [
                HoverFloatCard(
                  child: PriceCard(
                    title: 'ARSIP QUEST Board Game',
                    price: 'Rp160.000',
                    items: [
                      'Board game lengkap',
                      'Kartu interaktif',
                      'Uang permainan',
                      'Akses AR penuh',
                    ],
                    ctaLabel: 'Beli Sekarang',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TestimonialSection extends StatelessWidget {
  final bool visible;

  const TestimonialSection({super.key, required this.visible});

  static const testimonials = [
    Testimonial(
      name: 'Amira',
      role: 'Guru Sejarah',
      message:
          'Permainan ini membuat siswa antusias belajar sejarah Indonesia melalui strategi dan AR.',
    ),
    Testimonial(
      name: 'Bima',
      role: 'Orang Tua',
      message:
          'Desain premium dan mekanik yang mudah dipahami membuat keluarga kami betah bermain bersama.',
    ),
    Testimonial(
      name: 'Nadia',
      role: 'Pelajar',
      message:
          'Saya suka mempelajari situs sejarah berbeda sambil bersaing dengan teman.',
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
              title: 'Testimoni',
              subtitle: 'Suara pengguna',
              description:
                  'Dengarkan cerita dari pendidik dan keluarga yang telah menikmati pengalaman ARSIP QUEST.',
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 18,
              runSpacing: 18,
              children: testimonials
                  .map(
                    (testimonial) => HoverFloatCard(
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.softStone,
                          borderRadius: BorderRadius.circular(26),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 20,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.format_quote_rounded,
                              color: AppColors.accentRed,
                              size: 34,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              testimonial.message,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 18),
                            Text(
                              testimonial.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkBrown,
                              ),
                            ),
                            Text(
                              testimonial.role,
                              style: const TextStyle(color: AppColors.navy),
                            ),
                          ],
                        ),
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

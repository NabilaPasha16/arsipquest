import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/app_models.dart';
import '../widgets/common_widgets.dart';

class GallerySection extends StatefulWidget {
  final bool visible;

  const GallerySection({super.key, required this.visible});

  static const galleryItems = [
    GalleryItem(
      label: 'Peta Interaktif',
      color: AppColors.gold,
      imagePath: 'assets/Peta Interaktif.png',
    ),
    GalleryItem(
      label: 'Kartu AR',
      color: AppColors.accentRed,
      imagePath: 'assets/Kartu AR.png',
    ),
    GalleryItem(
      label: 'Board Premium',
      color: AppColors.navy,
      imagePath: 'assets/BoardGame Premium.png',
    ),
    GalleryItem(
      label: 'Uang Permainan',
      color: AppColors.darkBrown,
      imagePath: 'assets/Uang permainan.png',
    ),
  ];

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  final PageController _pageController = PageController(viewportFraction: 0.78);
  int _activePage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = GallerySection.galleryItems;
    return AnimatedSection(
      visible: widget.visible,
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
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                onPageChanged: (index) {
                  setState(() {
                    _activePage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: HoverFloatCard(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.parchment,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 26,
                              offset: const Offset(0, 16),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                              child: SizedBox(
                                height: 210,
                                child: Image.asset(
                                  item.imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 18,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.softStone,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.label,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: AppColors.darkBrown,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 6,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: item.color,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: _activePage == index ? 26 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _activePage == index
                        ? AppColors.gold
                        : AppColors.richBronzeGold.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
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
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 880;
                final largeWidth = isMobile ? constraints.maxWidth - 56 : 420.0;
                final smallWidth = isMobile ? constraints.maxWidth - 56 : 340.0;
                return Wrap(
                  spacing: 22,
                  runSpacing: 22,
                  children: [
                    HoverFloatCard(
                      child: SizedBox(
                        width: largeWidth,
                        child: PriceCard(
                          title: 'Paket Premium ARSIP QUEST',
                          price: 'Rp150.000',
                          subtitle: 'Pengalaman lengkap untuk 2-4 pemain',
                          items: [
                            'Board game premium dengan foil emas',
                            'Kartu AR interaktif dan kode QR',
                            'Uang permainan eksklusif',
                            'Panduan strategi dan cerita sejarah',
                            'Akses update konten digital',
                          ],
                          ctaLabel: 'Pesan Paket Premium',
                          ctaUrl:
                              'https://wa.me/6285731274016?text=Halo%20Arsip%20Quest%2C%20saya%20ingin%20memesan%20Paket%20Premium.',
                          featured: true,
                        ),
                      ),
                    ),
                    HoverFloatCard(
                      child: SizedBox(
                        width: smallWidth,
                        child: PriceCard(
                          title: 'Paket Starter',
                          price: 'Rp90.000',
                          subtitle: 'Paling cocok untuk sekolah dan keluarga',
                          items: [
                            'Board game lengkap',
                            'Kartu interaktif',
                            'Uang permainan',
                            'Akses AR dasar',
                          ],
                          ctaLabel: 'Beli Sekarang',
                          ctaUrl:
                              'https://wa.me/6285731274016?text=Halo%20Arsip%20Quest%2C%20saya%20ingin%20membeli%20Paket%20Starter.',
                          featured: false,
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
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 880;
                final cardWidth = isMobile ? constraints.maxWidth - 56 : 320.0;
                return Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: testimonials
                      .map(
                        (testimonial) => HoverFloatCard(
                          child: SizedBox(
                            width: cardWidth,
                            child: Container(
                              padding: const EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                color: AppColors.lightGold,
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow,
                                    blurRadius: 24,
                                    offset: const Offset(0, 16),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppColors.antiqueGold.withOpacity(
                                    0.18,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: AppColors.gold,
                                        child: Text(
                                          testimonial.name[0],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: AppColors.richBronzeGold,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              testimonial.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: AppColors.darkBrown,
                                                  ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              testimonial.role,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: AppColors
                                                        .richBronzeGold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    testimonial.message,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          color: AppColors.darkBrown
                                              .withOpacity(0.95),
                                        ),
                                  ),
                                ],
                              ),
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

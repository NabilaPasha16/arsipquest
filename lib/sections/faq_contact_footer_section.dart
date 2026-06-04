import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/app_models.dart';
import '../widgets/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

// --- Bagian FAQ (Sudah Oke) ---
class FaqSection extends StatelessWidget {
  final bool visible;

  const FaqSection({super.key, required this.visible});

  static const faqs = [
    FaqItem(
      question: 'Berapa lama durasi permainan?',
      answer:
          'Permainan biasanya berlangsung 35-50 menit, tergantung jumlah pemain dan gaya strategi.',
    ),
    FaqItem(
      question: 'Apakah AR wajib digunakan?',
      answer:
          'AR hadir sebagai fitur tambahan yang meningkatkan pengalaman, tetapi permainan dapat dinikmati tanpa AR.',
    ),
    FaqItem(
      question: 'Apakah cocok untuk anak sekolah?',
      answer:
          'Cocok untuk usia 10 tahun ke atas karena mekanik strategi dan konten sejarah yang dikemas interaktif.',
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
              title: 'FAQ',
              subtitle: 'Pertanyaan Umum',
              description:
                  'Jawaban cepat untuk pertanyaan yang sering diajukan tentang ARSIP QUEST dan fitur produk.',
            ),
            const SizedBox(height: 24),
            Column(
              children: faqs
                  .map(
                    (faq) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: FaqTile(
                        question: faq.question,
                        answer: faq.answer,
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

// --- Bagian Kontak (Sudah Oke) ---
class ContactSection extends StatelessWidget {
  final bool visible;

  const ContactSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      visible: visible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.black.withOpacity(0.04)),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 900;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  title: 'Kontak',
                  subtitle: 'Tetap terhubung',
                  description:
                      'Hubungi kami untuk pemesanan, pertanyaan, atau kebutuhan edukasi ARSIP QUEST. Kami siap membantu dengan cepat dan ramah.',
                ),
                const SizedBox(height: 28),
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 18,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Butuh bantuan cepat?',
                              style: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(
                                          context,
                                        ).textTheme.displaySmall?.color ??
                                        Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Tim kami siap menjawab pertanyaan tentang paket, fitur, dan cara bermain. Mulai chat sekarang untuk dukungan pemesanan khusus.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.color,
                                  ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {
                                final url = Uri.parse(
                                  'https://wa.me/6285731274016',
                                );
                                launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Text('Chat WhatsApp sekarang'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: isMobile ? 0 : 24,
                      height: isMobile ? 24 : 0,
                    ),
                    Flexible(
                      flex: 5,
                      child: Wrap(
                        spacing: 18,
                        runSpacing: 18,
                        children: const [
                          _ContactCard(
                            icon: Icons.chat_rounded,
                            title: 'WhatsApp',
                            value: '+62 857-3127-4016',
                            url: 'https://wa.me/6285731274016',
                          ),
                          _ContactCard(
                            icon: Icons.camera_alt_rounded,
                            title: 'Instagram',
                            value: '@arsipquest.id',
                            url: 'https://instagram.com/arsipquest.id',
                          ),
                          _ContactCard(
                            icon: Icons.email_rounded,
                            title: 'Email',
                            value: 'halo@arsipquest.id',
                            url: 'mailto:halo@arsipquest.id',
                          ),
                          _ContactCard(
                            icon: Icons.store_rounded,
                            title: 'Marketplace',
                            value: 'arsipquest.id/store',
                            url: 'https://arsipquest.id/store',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String url;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
  });

  Future<void> _launch() async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launch,
      child: HoverFloatCard(
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.black.withOpacity(0.04)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 14,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color:
                            Theme.of(context).textTheme.titleMedium?.color ??
                            Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Bagian Footer (Multi-Kolom seperti Tokopedia) ---
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: AppColors.navy,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 28,
        vertical: isMobile ? 32 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Multi-Kolom Links
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 32,
                children: [
                  // Kolom 1: ARSIP QUEST
                  SizedBox(
                    width: isMobile ? double.infinity : 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ARSIP QUEST',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: AppColors.parchment,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 16),
                        _FooterLink(
                          label: 'Tentang ARSIP QUEST',
                          url: 'https://arsipquest.id/about',
                        ),
                        _FooterLink(
                          label: 'Blog & Artikel',
                          url: 'https://arsipquest.id/blog',
                        ),
                        _FooterLink(
                          label: 'Karir',
                          url: 'https://arsipquest.id/career',
                        ),
                        _FooterLink(
                          label: 'Partner Edukasi',
                          url: 'https://arsipquest.id/partner',
                        ),
                      ],
                    ),
                  ),
                  // Kolom 2: Produk
                  SizedBox(
                    width: isMobile ? double.infinity : 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Produk',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 16),
                        _FooterLink(
                          label: 'Paket Sekolah',
                          url: 'https://arsipquest.id/school',
                        ),
                        _FooterLink(
                          label: 'Paket Komunitas',
                          url: 'https://arsipquest.id/community',
                        ),
                        _FooterLink(
                          label: 'Cara Bermain',
                          url: 'https://arsipquest.id/howto',
                        ),
                        _FooterLink(
                          label: 'Galeri & Testimoni',
                          url: 'https://arsipquest.id/gallery',
                        ),
                      ],
                    ),
                  ),
                  // Kolom 3: Keamanan & Privasi
                  SizedBox(
                    width: isMobile ? double.infinity : 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keamanan & Privasi',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 16),
                        _FooterLink(
                          label: 'Kebijakan Privasi',
                          url: 'https://arsipquest.id/privacy',
                        ),
                        _FooterLink(
                          label: 'Syarat & Ketentuan',
                          url: 'https://arsipquest.id/terms',
                        ),
                        _FooterLink(
                          label: 'FAQ',
                          url: 'https://arsipquest.id/faq',
                        ),
                      ],
                    ),
                  ),
                  // Kolom 4: Kontak & Sosial Media
                  SizedBox(
                    width: isMobile ? double.infinity : 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ikuti Kami',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          spacing: 12,
                          children: [
                            _SocialMediaIcon(
                              icon: Icons.chat_rounded,
                              label: 'WhatsApp',
                              url: 'https://wa.me/6285731274016',
                            ),
                            _SocialMediaIcon(
                              icon: Icons.camera_alt_rounded,
                              label: 'Instagram',
                              url: 'https://instagram.com/arsipquest.id',
                            ),
                            _SocialMediaIcon(
                              icon: Icons.email_rounded,
                              label: 'Email',
                              url: 'mailto:halo@arsipquest.id',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 32),

          // Divider
          Container(height: 1, color: Theme.of(context).dividerColor),

          const SizedBox(height: 20),

          // Copyright & Links Bawah
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '© 2026 ARSIP QUEST. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              if (!isMobile)
                Row(
                  spacing: 16,
                  children: [
                    _SimpleFooterLink(label: 'Indonesia'),
                    _SimpleFooterLink(label: 'English'),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final String url;

  const _FooterLink({required this.label, required this.url});

  Future<void> _launch() async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _launch,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _SocialMediaIcon({
    required this.icon,
    required this.label,
    required this.url,
  });

  Future<void> _launch() async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _launch,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary.withOpacity(0.08),
              ),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _SimpleFooterLink extends StatelessWidget {
  final String label;

  const _SimpleFooterLink({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

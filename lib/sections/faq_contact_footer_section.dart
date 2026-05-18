import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/app_models.dart';
import '../widgets/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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

class ContactSection extends StatelessWidget {
  final bool visible;

  const ContactSection({super.key, required this.visible});

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
              title: 'Kontak',
              subtitle: 'Tetap terhubung',
              description:
                  'Hubungi kami melalui WhatsApp, Instagram, email, atau marketplace untuk pemesanan dan pertanyaan produk.',
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
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
          ],
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
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launch,
      child: HoverFloatCard(
        child: Container(
          width: 240,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.softStone,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: AppColors.gold.withValues(alpha: 0.14)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.navy,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: AppColors.parchment, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkBrown,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(value, style: const TextStyle(color: AppColors.navy)),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: AppColors.navy,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.navy,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'ARSIP QUEST',
            style: TextStyle(
              color: AppColors.parchment,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Sejarah menjadi petualangan premium dan edukatif.',
            style: TextStyle(color: AppColors.softStone),
          ),
          SizedBox(height: 18),
          Text(
            '© 2026 ARSIP QUEST. All rights reserved.',
            style: TextStyle(color: AppColors.softStone, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

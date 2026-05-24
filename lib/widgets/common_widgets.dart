import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constants/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineMedium?.copyWith(color: AppColors.navy),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: textTheme.titleLarge?.copyWith(color: AppColors.accentRed),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            description,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.darkBrown.withOpacity(0.88),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedSection extends StatelessWidget {
  final Widget child;
  final bool visible;
  final Color? backgroundColor;

  const AnimatedSection({
    super.key,
    required this.child,
    required this.visible,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: visible ? Offset.zero : const Offset(0, 0.08),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOut,
        child: Container(
          color: backgroundColor ?? Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
        border: Border.all(color: AppColors.gold.withOpacity(0.18), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 8,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(icon, color: AppColors.navy, size: 30),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.parchment),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.parchment.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final List<String> items;
  final String ctaLabel;
  final String ctaUrl;
  final bool featured;

  const PriceCard({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.items,
    required this.ctaLabel,
    required this.ctaUrl,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = featured
        ? AppColors.gold.withOpacity(0.12)
        : AppColors.parchment;
    final borderColor = featured
        ? AppColors.gold
        : AppColors.gold.withOpacity(0.18);
    final priceColor = featured ? AppColors.darkBrown : AppColors.accentRed;
    final badge = featured
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.accentRed,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              'Paling Popular',
              style: TextStyle(
                color: AppColors.parchment,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        : null;

    return Container(
      width: featured ? 420 : 340,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(34),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badge != null) ...[badge, const SizedBox(height: 18)],
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.darkBrown,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.darkBrown.withOpacity(0.82),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            price,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: priceColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 22),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8, right: 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.navy,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.navy.withOpacity(0.85),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final uri = Uri.parse(ctaUrl);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: featured
                    ? AppColors.accentRed
                    : AppColors.navy,
                foregroundColor: AppColors.parchment,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 8,
              ),
              child: Text(ctaLabel),
            ),
          ),
        ],
      ),
    );
  }
}

class FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const FaqTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        collapsedBackgroundColor: AppColors.softStone,
        backgroundColor: AppColors.softStone,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          question,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.darkBrown,
          ),
        ),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [
          Text(
            answer,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.navy.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class HoverFloatCard extends StatefulWidget {
  final Widget child;
  const HoverFloatCard({super.key, required this.child});

  @override
  State<HoverFloatCard> createState() => _HoverFloatCardState();
}

class _HoverFloatCardState extends State<HoverFloatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _offsetY = Tween<double>(
      begin: 0,
      end: -10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _offsetY,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, _offsetY.value),
          child: child,
        ),
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
              color: AppColors.darkBrown.withValues(alpha: 0.88),
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

  const AnimatedSection({
    super.key,
    required this.child,
    required this.visible,
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
        child: child,
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
        color: AppColors.softStone,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
        border: Border.all(
          color: AppColors.gold.withValues(alpha: 0.16),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.parchment, size: 28),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.darkBrown),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.navy.withValues(alpha: 0.85),
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
  final List<String> items;
  final String ctaLabel;

  const PriceCard({
    super.key,
    required this.title,
    required this.price,
    required this.items,
    required this.ctaLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.parchment,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.18)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.darkBrown),
          ),
          const SizedBox(height: 12),
          Text(
            price,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: AppColors.accentRed,
              fontSize: 38,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8, right: 12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.navy,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.navy.withValues(alpha: 0.85),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          ElevatedButton(onPressed: () {}, child: Text(ctaLabel)),
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
              color: AppColors.navy.withValues(alpha: 0.9),
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

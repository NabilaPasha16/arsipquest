import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class NavbarSection extends StatelessWidget {
  final bool elevated;
  final void Function(String) onItemTap;

  const NavbarSection({
    super.key,
    required this.elevated,
    required this.onItemTap,
  });

  void _openMobileMenu(BuildContext context, List<String> items) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.parchment.withOpacity(0.98),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (context) {
        return _MobileNavbarMenu(
          items: items,
          onItemTap: (item) {
            Navigator.of(context).pop();
            onItemTap(item);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Memisahkan list String murni untuk navigasi
    final items = [
      'Beranda',
      'Tentang',
      'Keunggulan',
      'Komponen',
      'Cara Bermain',
      'Galeri',
      'Harga',
      'Video',
      'FAQ',
      'Kontak',
    ];

    return Container(
      // Dekorasi container utama navbar
      decoration: BoxDecoration(
        color: AppColors.parchment,
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: AppColors.shadow.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 900) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _Logo(),
                IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: AppColors.navy,
                    size: 28,
                  ),
                  tooltip: 'Menu',
                  onPressed: () => _openMobileMenu(context, items),
                ),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _Logo(),
              const SizedBox(width: 40),
              Expanded(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  children: items
                      .map(
                        (item) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => onItemTap(item),
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: AppColors.navy,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () => onItemTap('Kontak'),
                child: const Text('Dapatkan Sekarang'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.parchment,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/logo_arsipquest.png', fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Text(
          'ARSIP QUEST',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.darkBrown,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}

class _MobileNavbarMenu extends StatelessWidget {
  final List<String> items;
  final void Function(String) onItemTap;

  const _MobileNavbarMenu({required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: AppColors.navy),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  title: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.darkBrown,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                  onTap: () => onItemTap(item),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  tileColor: AppColors.softStone,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

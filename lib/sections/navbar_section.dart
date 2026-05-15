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

  @override
  Widget build(BuildContext context) {
    final items = [
      'Beranda',
      'Tentang',
      'Keunggulan',
      'Komponen',
      'Cara Bermain',
      'Galeri',
      'Harga',
      'FAQ',
      'Kontak',
    ];

    return Material(
      color: AppColors.parchment.withValues(alpha: elevated ? 0.96 : 0.72),
      elevation: elevated ? 6 : 0,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.darkBrown.withValues(alpha: elevated ? 0.16 : 0.08)),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 900) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Logo(),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.menu_rounded, color: AppColors.darkBrown),
                    itemBuilder: (_) => items
                        .map((item) => PopupMenuItem<String>(
                              value: item,
                              child: Text(item, style: const TextStyle(color: AppColors.navy)),
                            ))
                        .toList(),
                    onSelected: onItemTap,
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
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.map_outlined, color: AppColors.accentRed, size: 28),
        SizedBox(width: 10),
        Text(
          'ARSIP QUEST',
          style: TextStyle(
            color: AppColors.darkBrown,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
      ],
    );
  }
}

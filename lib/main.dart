import 'package:arsipquest/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'sections/about_features_section.dart';
import 'sections/components_howto_section.dart';
import 'sections/faq_contact_footer_section.dart';
import 'sections/gallery_pricing_testimonial_section.dart';
import 'sections/hero_section.dart';
import 'sections/navbar_section.dart';

void main() {
  runApp(const ArsipQuestApp());
}

class ArsipQuestApp extends StatelessWidget {
  const ArsipQuestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARSIP QUEST',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(scrollbars: true),
      theme: AppTheme.light,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, bool> _visibleSections = {
    'Beranda': true,
    'Tentang': false,
    'Keunggulan': false,
    'Komponen': false,
    'Cara Bermain': false,
    'Galeri': false,
    'Harga': false,
    'FAQ': false,
    'Kontak': false,
  };

  final Map<String, GlobalKey> _sectionKeys = {
    'Beranda': GlobalKey(),
    'Tentang': GlobalKey(),
    'Keunggulan': GlobalKey(),
    'Komponen': GlobalKey(),
    'Cara Bermain': GlobalKey(),
    'Galeri': GlobalKey(),
    'Harga': GlobalKey(),
    'FAQ': GlobalKey(),
    'Kontak': GlobalKey(),
  };

  bool _navElevated = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleScroll());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final offset = _scrollController.offset;
    final navElevation = offset > 24;
    if (navElevation != _navElevated) {
      setState(() => _navElevated = navElevation);
    }
    _updateSectionVisibility();
  }

  void _updateSectionVisibility() {
    final viewportHeight = MediaQuery.of(context).size.height;
    _sectionKeys.forEach((key, sectionKey) {
      final context = sectionKey.currentContext;
      if (context == null) return;
      final box = context.findRenderObject() as RenderBox?;
      if (box == null) return;
      final position = box.localToGlobal(Offset.zero).dy;
      final visible = position < viewportHeight * 0.88;
      if (_visibleSections[key] != visible) {
        setState(() {
          _visibleSections[key] = visible;
        });
      }
    });
  }

  void _scrollTo(String section) {
    final targetKey = _sectionKeys[section];
    if (targetKey == null) return;
    final context = targetKey.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.lightGold, AppColors.gold.withOpacity(0.08)],
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 90),
                Container(
                  key: _sectionKeys['Beranda'],
                  child: HeroSection(
                    visible: _visibleSections['Beranda'] ?? true,
                    onCtaTap: _scrollTo,
                  ),
                ),
                Container(
                  key: _sectionKeys['Tentang'],
                  child: AboutSection(
                    visible: _visibleSections['Tentang'] ?? false,
                  ),
                ),
                Container(
                  key: _sectionKeys['Keunggulan'],
                  child: FeatureSection(
                    visible: _visibleSections['Keunggulan'] ?? false,
                  ),
                ),
                Container(
                  key: _sectionKeys['Komponen'],
                  child: ComponentsSection(
                    visible: _visibleSections['Komponen'] ?? false,
                  ),
                ),
                Container(
                  key: _sectionKeys['Cara Bermain'],
                  child: HowToPlaySection(
                    visible: _visibleSections['Cara Bermain'] ?? false,
                  ),
                ),
                Container(
                  key: _sectionKeys['Galeri'],
                  child: GallerySection(
                    visible: _visibleSections['Galeri'] ?? false,
                  ),
                ),
                Container(
                  key: _sectionKeys['Harga'],
                  child: PricingSection(
                    visible: _visibleSections['Harga'] ?? false,
                  ),
                ),
                Container(
                  key: _sectionKeys['FAQ'],
                  child: FaqSection(visible: _visibleSections['FAQ'] ?? false),
                ),
                Container(
                  key: _sectionKeys['Kontak'],
                  child: const Column(
                    children: [ContactSection(visible: true), FooterSection()],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavbarSection(elevated: _navElevated, onItemTap: _scrollTo),
          ),
        ],
      ),
    );
  }
}

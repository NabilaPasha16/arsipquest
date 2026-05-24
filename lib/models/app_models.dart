import 'package:flutter/material.dart';

class FeatureItem {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class ComponentItem {
  final String title;
  final IconData icon;

  const ComponentItem({required this.title, required this.icon});
}

class StepItem {
  final String step;
  final String label;

  const StepItem({required this.step, required this.label});
}

class GalleryItem {
  final String label;
  final Color color;
  final String imagePath;

  const GalleryItem({
    required this.label,
    required this.color,
    required this.imagePath,
  });
}

class PricePackage {
  final String title;
  final String price;
  final List<String> benefits;

  const PricePackage({
    required this.title,
    required this.price,
    required this.benefits,
  });
}

class Testimonial {
  final String name;
  final String role;
  final String message;

  const Testimonial({
    required this.name,
    required this.role,
    required this.message,
  });
}

class FaqItem {
  final String question;
  final String answer;

  const FaqItem({required this.question, required this.answer});
}

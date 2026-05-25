import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: isSelected
                  ? primaryRed.withAlpha(30)
                  : const Color(0xFFFCE4EC),
              borderRadius: BorderRadius.circular(18),
              border: isSelected
                  ? Border.all(color: primaryRed, width: 2.5)
                  : Border.all(color: Colors.transparent, width: 2.5),
            ),
            child: category.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.network(
                      category.imageUrl!,
                      color: primaryRed,
                      fit: BoxFit.contain,
                    ),
                  )
                : Icon(
                    category.icon,
                    size: 38,
                    color: primaryRed,
                  ),
          ),

          const SizedBox(height: 8),

          Text(
            category.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight:
                  isSelected ? FontWeight.w700 : FontWeight.w500,
              color:
                  isSelected ? primaryRed : const Color(0xFF424242),
            ),
          ),
        ],
      ),
    );
  }
}

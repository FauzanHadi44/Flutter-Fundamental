import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product_model.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';

/// Screen utama Katalog Produk.
/// Widget utama yang diimplementasikan:
/// • [Column]   – menyusun elemen AppBar, search, kategori, header, grid secara vertikal
/// • [Row]      – menyusun header produk (jumlah + tombol view) dan baris harga
/// • [ListView] – horizontal untuk daftar kategori, vertikal sebagai scroll utama
/// • [Image]    – gambar produk menggunakan Image.network (Network Image)
class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  // State
  int _selectedCategoryIndex = 0; 
  bool _isGridView = true;    
  String _searchQuery = ''; 

  final TextEditingController _searchController = TextEditingController();
  // Filter produk berdasarkan kategori & query
  List<ProductModel> get _filteredProducts {
    List<ProductModel> result = products;
    // Filter berdasarkan kategori
    if (_selectedCategoryIndex != 0) {
      final selectedCategory = categories[_selectedCategoryIndex].name;
      result = result
          .where((p) => p.category == selectedCategory)
          .toList();
    }

    // Filter berdasarkan query pencarian
    if (_searchQuery.isNotEmpty) {
      result = result
          .where((p) =>
              p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return result;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      // Judul 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, 
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Color(0xFF212121),
          ),
        ),
        titleSpacing: 20, 
      ),

      // Body
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),

          _buildSearchBar(),

          const SizedBox(height: 20),

          // Label Kategori 
          const Text(
            'Kategori',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF212121),
            ),
          ),

          const SizedBox(height: 14),

          // Daftar Kategori Horizontal 
          _buildCategoryList(),

          const SizedBox(height: 24),

          // Header Produk
          _buildProductHeader(),

          const SizedBox(height: 16),

          // Grid / List Produk 
          _isGridView ? _buildProductGrid() : _buildProductList(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // SEARCH BAR
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() => _searchQuery = value),
        decoration: InputDecoration(
          hintText: 'Search fashion products...',
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  color: Colors.grey,
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  // CATEGORY LIST  →  ListView horizontal
  Widget _buildCategoryList() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, i) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categories[index],
            isSelected: _selectedCategoryIndex == index,
            onTap: () => setState(() => _selectedCategoryIndex = index),
          );
        },
      ),
    );
  }

  // HEADER PRODUK
  Widget _buildProductHeader() {
    final filtered = _filteredProducts;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${filtered.length} Products',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF212121),
              ),
            ),
            const Text(
              'Based on your filter',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),

        const Spacer(),

        ViewToggleButton(
          icon: Icons.view_list_rounded,
          isActive: !_isGridView,
          onTap: () => setState(() => _isGridView = false),
        ),

        const SizedBox(width: 8),

        ViewToggleButton(
          icon: Icons.grid_view_rounded,
          isActive: _isGridView,
          onTap: () => setState(() => _isGridView = true),
        ),
      ],
    );
  }

  // GRID PRODUK
  Widget _buildProductGrid() {
    final filtered = _filteredProducts;

    if (filtered.isEmpty) return _buildEmptyState();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        return ProductCard(product: filtered[index]);
      },
    );
  }

  // LIST PRODUK
  Widget _buildProductList() {
    final filtered = _filteredProducts;

    if (filtered.isEmpty) return _buildEmptyState();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filtered.length,
      separatorBuilder: (context, i) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return ProductListTile(product: filtered[index]);
      },
    );
  }

  // EMPTY STATE
  Widget _buildEmptyState() {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded,
                size: 60, color: Colors.grey.shade300),
            const SizedBox(height: 12),
            Text(
              'Produk tidak ditemukan',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HELPER WIDGET: Toggle View Button
class ViewToggleButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const ViewToggleButton({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFE53935)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive
                ? const Color(0xFFE53935)
                : const Color(0xFFE0E0E0),
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: const Color(0xFFE53935).withAlpha(60),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          size: 20,
          color: isActive ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

// HELPER WIDGET: Product List Tile (mode list)
class ProductListTile extends StatelessWidget {
  final ProductModel product;

  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.network(
              product.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Container(
                width: 120,
                height: 120,
                color: const Color(0xFFF5F5F5),
                child: const Icon(Icons.broken_image_outlined,
                    color: Colors.grey),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: primaryRed.withAlpha(25),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 10,
                        color: primaryRed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212121),
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF212121),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '\$${product.originalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: primaryRed,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${product.discountPercent}%',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

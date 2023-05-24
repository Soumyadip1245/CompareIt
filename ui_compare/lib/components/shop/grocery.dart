import 'package:ui_compare/common/common.dart';

class Grocery extends StatefulWidget {
  final String? search;
  final Function(String) onSearchChanged;
  const Grocery({this.search, required this.onSearchChanged});

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  List<dynamic> color = [
    const Color(0xFFFFFB7882),
    const Color(0xFFFF3d82AE),
    const Color(0xFFFFD48984),
    const Color(0xFFFFE6B398),
  ];
  List<dynamic> ecommerceData = [];
  void initState() {
    _filterProducts();
  }

  @override
  void didUpdateWidget(Grocery oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.search != oldWidget.search) {
      _filterProducts();
    }
  }

  void _filterProducts() {
    if (widget.search != null && widget.search!.isNotEmpty) {
      final searchQuery = widget.search!.toLowerCase();
      ecommerceData = ShopData()
          .data
          .where((product) =>
              product['category'] == 'Grocery' &&
              product['name'].toString().toLowerCase().contains(searchQuery))
          .toList();
    } else {
      ecommerceData = ShopData()
          .data
          .where((product) => product['category'] == 'Grocery')
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ecommerceData.length,
      itemBuilder: (BuildContext context, int index) {
        var color1 = color[index % color.length];
        var product = ecommerceData[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/product',
                arguments: [product, color1]);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                height: 212,
                width: 200,
                decoration: BoxDecoration(
                  color: color1.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  product['image'],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              TextDesign(
                text: product['name'],
                size: 15,
                color: Colors.grey,
              ),
              TextDesign(
                text: "Rs. ${product['price']}",
                size: 15,
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:dars_6_uy_ishi/controllers/category_controller.dart';
import 'package:dars_6_uy_ishi/views/screens/products_screen.dart';
import 'package:dars_6_uy_ishi/views/screens/user_screen.dart';
import 'package:dars_6_uy_ishi/views/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Categories"),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: categoryController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Categoriyalar mavjud emas"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final categories = snapshot.data;
          return categories!.isEmpty
              ? const Center(
                  child: Text("No Categories"),
                )
              : Container(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                      itemCount: categories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 220),
                      itemBuilder: (context, index) {
                        return CategoryWidget(category: categories[index]);
                      }),
                );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            label: const Text(
              "Products",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => UserScreen()));
            },
            label: const Text(
              "Users",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

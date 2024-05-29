import 'package:dars_6_uy_ishi/controllers/user_controller.dart';
import 'package:dars_6_uy_ishi/views/screens/category_screen.dart';
import 'package:dars_6_uy_ishi/views/screens/products_screen.dart';
import 'package:dars_6_uy_ishi/views/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: userController.getUsers(),
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
              child: Text("Foydalanuvchilar mavjud emas"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final users = snapshot.data;
          return users!.isEmpty
              ? const Center(
                  child: Text("Foydalanuvchilar topilmadi"),
                )
              : Container(
                  padding: EdgeInsets.all(16),
                  child: GridView.builder(
                      itemCount: users.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 220,
                      ),
                      itemBuilder: (context, index) {
                        return UserWidget(user: users[index]);
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
                  MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
            label: const Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}

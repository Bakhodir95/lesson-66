import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/service/product_firebases.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    final productfirebases = context.read<ProductFirebases>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialog(context: context, builder: (context) => AddCar());
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: productfirebases.productsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null || !snapshot.hasData) {
            return const Center(
              child: Text("malumot mavjud emas "),
            );
          }
          final products = snapshot.data!.docs;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = Product.fromQuery(products[index]);
              return ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(product.imageUrl),
                ),
                title: Text(product.title),
                subtitle: Text(product.price.toStringAsFixed(2)),
              );
            },
          );
        },
      ),
    );
  }
}

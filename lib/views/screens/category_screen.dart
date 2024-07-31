import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/product_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ProductController productController = ProductController();
  String? selectedValue;
  final List<String> items = ['Price', 'Rating'];

  @override
  void initState() {
    super.initState();
    selectedValue = items.isNotEmpty ? items[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 360,
          decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://media.architecturaldigest.com/photos/64f71af50a84399fbdce2f6a/16:9/w_2560%2Cc_limit/Living%2520with%2520Lolo%2520Photo%2520Credit_%2520Life%2520Created%25204.jpg'), fit: BoxFit.cover)),
          child: const Center(
            child: Text(
              "Living Room",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Have ${productController.list.length} product",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: selectedValue,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Color(0xff1F2261),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
        Flexible(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
            itemCount: productController.list.length,
            itemBuilder: (context, index) {
              final product = productController.list[index];
              return Card(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(product.imageUrl),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            index.toString(),
                            style: const TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                      Text(
                        product.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(color: Colors.green, fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          ZoomTapAnimation(
                            onTap: () {
                              productController.isLiked(product.id);
                              setState(() {});
                            },
                            child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green.shade200),
                                child: Icon(
                                  Icons.favorite_outlined,
                                  color: product.isLiked ? Colors.red : Colors.white,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}

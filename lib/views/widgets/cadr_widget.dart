import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/card_controller.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:provider/provider.dart';

class CadrWidget extends StatefulWidget {
  const CadrWidget({super.key});

  @override
  State<CadrWidget> createState() => _CadrWidgetState();
}

class _CadrWidgetState extends State<CadrWidget> {
  @override
  Widget build(BuildContext context) {
    final cardController = context.watch<CardController>();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "My Card",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: cardController.productsinCard.length,
              itemBuilder: (context, index) {
                final product = cardController.productsinCard[index];
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      height: 250,
                      width: 100,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cardController.deletetoCard(product);
                                setState(() {});
                              },
                              icon: const Icon(CupertinoIcons.minus),
                                ),
                            Text(product.count.toString()),
                            IconButton(
                                onPressed: () {
                                  cardController.addtoCard(product);
                                  setState(() {});
                                },
                                icon: const Icon(CupertinoIcons.add)),
                          ],
                        )
                      ],
                    ),
                    trailing: Text(
                      "${product.count * product.price} \$",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

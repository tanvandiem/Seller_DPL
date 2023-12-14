// display_products_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/product/edit_product.dart';
import 'package:untitled2/product/product.dart';
import 'package:untitled2/product/product_list.dart';

class DisplayProductsScreen extends StatefulWidget {
  final List<Product> products;
  final Function(String) onProductDeleted;
  final Function(Product) onProductUpdated;

  DisplayProductsScreen({
    required this.products,
    required this.onProductDeleted,
    required this.onProductUpdated,
  });

  @override
  _DisplayProductsScreenState createState() => _DisplayProductsScreenState();
}

class _DisplayProductsScreenState extends State<DisplayProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      padding: EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 21.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(
                      0,
                      4,
                    ),
                  ),
                ],
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.file(
                        File('${product.images?[0]}'),
                        height: 80.h,
                        width: 80.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product.name}',
                            //style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Price: ${product.price}',
                            //style: theme.textTheme.bodySmall,
                            maxLines: 2,
                          ),
                          Text(
                            'Quantity: ${product.availableQuantity}',
                            //style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                         _navigateToEditProductScreen(context, product);
                        },
                        child: Container(
                          width: 100.w,
                          height: 40.h,
                          child: Center(
                              child: Text(
                            "Edit",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          )),
                          decoration: BoxDecoration(
                              //color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(35, 0, 0, 0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                         width: 100.w,
                          height: 40.h,
                        child: ElevatedButton(
                          
                         child: Text("Delete"),
                          
                      
                          // Add onPressed callback for the Delete button
                          onPressed: () {
                            // Add your logic for deleting here
                            // For example, you can show a confirmation dialog and then delete the address
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Delete Product"),
                                content: Text(
                                    "Are you sure you want to delete this product?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Add logic to delete the address here
                                      // You can use setState or any state management solution to update the UI
                                      // setState(() {
                                      //   productes.removeAt(index);
                                      // });
                                      // widget
                                      //     .onProductDeleted(product.id as int);
                                      // Navigator.of(context)
                                      //     .pop(); // Close the dialog
                                      widget.onProductDeleted(product.id as String);
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _navigateToEditProductScreen(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProductScreen(
          product: product,
          onProductUpdated: widget.onProductUpdated,  
          products: [], 
        ),
      ),
    );
  }
}

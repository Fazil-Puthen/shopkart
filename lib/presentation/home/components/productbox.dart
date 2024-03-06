import 'package:flutter/material.dart';
import 'package:shopcart/model/productmodel.dart';
import 'package:shopcart/presentation/detailscreen/detailscreen.dart';

class productbox extends StatelessWidget {
  final Productmodel product;
  const productbox({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => DetailScreen(product: product,)));
      },
      child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Image.asset(product.image[0],fit: BoxFit.cover,),),
              Text(product.name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              Text('₹ ${product.price}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.red),)
            ],
          ));
          }
        }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSellerState extends StatefulWidget {
  const OrderSellerState({super.key});

  @override
  State<OrderSellerState> createState() => __OrderSellerStateState();
}

class __OrderSellerStateState extends State<OrderSellerState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hekki'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          //height: 120.h,
          width: 330.w,
          decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0)
                ),
              ],
              ),
          child: Material(
            //color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  height:80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                  ),
                  SizedBox(width: 15.w,),
                  Container(
                    height: 80.h,
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                        Text("button",style: TextStyle(
                          fontSize: 16
                        ),),
                        Text("button",style: TextStyle(
                          fontSize: 16,color: Colors.grey,
                        ),),
                        SizedBox(height: 10.h,),
                       Text("button",style: TextStyle(
                        fontSize: 16,fontWeight: FontWeight.bold
                       ),),
                       
                      ],
                    ),
                  ),
                   SizedBox(width: 6,),
                    
                  // Column(
                  //   children: [
                  //     Text("hello")
                  //   ],
                  // )
        
                
              ],
            ),
          ),
        ),
      )
    );
  }
}

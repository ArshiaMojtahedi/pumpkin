import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pumpkin/Data/model/cartItem.dart';

import '../../../../App/colors.dart';
import '../../../../Data/model/product.dart';
import '../../../Widgets/common/twoButtonAlertDialog.dart';
import '../cubit/cart_cubit.dart';

class CartRowItem extends StatelessWidget {
  late CartItem product;
  CartRowItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (ctx) => GetIt.instance.get(),
      child: _CartRowItem(product),
    );
  }
}

late CartCubit _bloc;

class _CartRowItem extends StatelessWidget {
  late CartItem product;
  _CartRowItem(this.product);

  @override
  Widget build(BuildContext context) {
    _bloc = context.read();

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed("/productDetail",
                            arguments: product.id),
                        child: Image.memory(
                          product.image as Uint8List,
                          height: 70,
                          width: 70,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 160,
                            child: Text(
                              product.name as String,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            product.description as String,
                            style: TextStyle(
                                fontSize: 12, color: Appcolors().textColor2),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                child: ElevatedButton(
                                    child: Image.asset(
                                      "assets/images/decrease_icon.png",
                                      color: Colors.white,
                                    ),
                                    onPressed: () => null,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Appcolors().red,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    17.0)))),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                child: Text(
                                  product.amount.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Appcolors().textColor2),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                child: ElevatedButton(
                                  child: Image.asset(
                                    "assets/images/increase_icon.png",
                                    color: Colors.white,
                                  ),
                                  onPressed: () =>
                                      _bloc.cartItemDelete(product.id),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolors().green,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(17.0)),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      // SizedBox(
                      //   width: 32,
                      // ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                          child: Image.asset(
                            "assets/images/close_icon.png",
                            height: 14,
                          ),
                          onTap: () => Get.dialog(
                              TwoButtonAlertDialog(
                                text:
                                    'Are you sure you want to delete this item from your cart?',
                                yesFunction: () {
                                  _bloc.cartItemDelete(product.id);

                                  Get.back();
                                  _bloc.fetch();
                                },
                                noFunction: () => Get.back(),
                              ),
                              barrierDismissible: false)),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                          "\$" +
                              (product.amount * (product.price as double))
                                  .toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pumpkin/Presentation/product/cubit/product_cubit.dart';

import '../../../App/colors.dart';
import '../../Widgets/common/appbar.dart';
import '../../Widgets/common/appbarLayout.dart';
import '../../Widgets/common/button.dart';
import '../../Widgets/common/twoButtonAlertDialog.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (ctx) => GetIt.instance.get(),
      child: _ProductDetailScreen(),
    );
  }
}

late ProductCubit _bloc;

class _ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String id = Get.arguments;

    _bloc = context.read();
    _bloc.fetch(id);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF4F4F4),
          appBar: AppBarLayout(
            child: ProductDetailAppbar(),
          ),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductProgress) {
                return CircularProgressIndicator();
              } else if (state is ProductFailed) {
                return Text(state.msg.message);
              } else if (state is ProductSuccesed) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Image.memory(
                              state.data.image,
                              width: 330,
                              height: 200,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(24),
                          color: Color(0xffF4F4F4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.data.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    child: Image.asset(

                                        // "assets/images/heart_filled_icon.png"
                                        "assets/images/heart_outline_icon.png",
                                        height: 24,
                                        color: Appcolors().green),
                                    onTap: () => null,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                state.data.description,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Appcolors().textColor2),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          height: 40,
                                          width: 17,
                                          child: Image.asset(
                                            'assets/images/decrease_icon.png',
                                            width: 17,
                                          ),
                                        ),
                                        onTap: () => null,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(17),
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: Color(0xffE2E2E2),
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: Center(
                                            child: Text(
                                          ' controller.quantity.toString()',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        child: Container(
                                          width: 17,
                                          height: 40,
                                          child: Image.asset(
                                            'assets/images/increase_icon.png',
                                            width: 17,
                                          ),
                                        ),
                                        onTap: () =>
                                            ' controller.increaseItem(product.id)',
                                      )
                                    ],
                                  ),
                                  Text(
                                    "\$" + state.data.price.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Product Detail",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                state.data.detail != ('')
                                    ? state.data.detail
                                    : "No Detail",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Appcolors().textColor2),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
          // bottomNavigationBar: BottomAppBar(
          //   color: Colors.transparent,
          //   child: Container(
          //     padding: EdgeInsets.all(16),
          //     child: AppRaiseButton(
          //       height: 60,
          //       color: controller.itemExist(product.id)
          //           ? (controller.quantityCartEqual(product.id)
          //               ? Appcolors().red
          //               : Appcolors().darkOrange)
          //           : Appcolors().green,
          //       label: controller.itemExist(product.id)
          //           ? (controller.quantityCartEqual(product.id)
          //               ? "Remove From Cart"
          //               : "Change Quantity")
          //           : "Add To Cart",
          //       function: () {
          //         if (controller.itemExist(product.id)) {
          //           if (controller.quantityCartEqual(product.id)) {
          //             Get.dialog(
          //                 TwoButtonAlertDialog(
          //                   text:
          //                       'Are you sure you want to delete this item from your cart?',
          //                   yesFunction: () {
          //                     String pName = controller.dataBox
          //                         .get(product.id)
          //                         .title;
          //                     controller.removeItem(product.id);
          //                     cartConroller.update();
          //                     Get.back();
          //                     Get.back();
          //                     Get.snackbar("Item Removed",
          //                         "$pName has been removed from your cart",
          //                         colorText: Appcolors().red);
          //                   },
          //                   noFunction: () => Get.back(),
          //                 ),
          //                 barrierDismissible: false);
          //           } else {
          //             controller.changeItemQuantity(CartItem(
          //               id: product.id,
          //               title: product.title,
          //               image: product.image,
          //               price: product.price,
          //               description: product.description,
          //               amount: controller.quantity,
          //             ));
          //             cartConroller.update();
          //             Get.back();
          //             Get.snackbar("Quantity Changed",
          //                 "${controller.dataBox.get(product.id).title} quantity has been changed to ${controller.dataBox.get(product.id).amount.toString()}");
          //           }
          //         } else {
          //           controller.addItem(CartItem(
          //             id: product.id,
          //             title: product.title,
          //             image: product.image,
          //             price: product.price,
          //             description: product.description,
          //             amount: controller.quantity,
          //           ));
          //           cartConroller.update();
          //           Get.back();
          //           Get.snackbar("Item added",
          //               "${controller.dataBox.get(product.id).title} is now your cart!");
          //         }
          //       },
          //     ),
          //   ),
          //   elevation: 0,
          // ),
        ),
      ),
    );
  }
}

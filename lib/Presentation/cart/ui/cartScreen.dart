import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'package:pumpkin/Presentation/cart/ui/widgets/cartItem.dart';
import 'package:pumpkin/Presentation/mainScreen.dart';

import '../../../App/colors.dart';
import '../../Widgets/common/appbar.dart';
import '../../Widgets/common/appbarLayout.dart';
import '../../Widgets/common/button.dart';
import 'cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (ctx) => GetIt.instance.get(),
      child: _CartScreen(),
    );
  }
}

late CartCubit _bloc;

class _CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _bloc = context.read();
    _bloc.fetch();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
            child: CartAppBar(),
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartItemsSuccesed) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.data.length,
                            itemBuilder: (ctx, i) => CartRowItem(
                              id: 0,
                              title: state.data[i].name.toString(),
                              description: state.data[i].description.toString(),
                              amount: state.data[i].amount,
                              price: state.data[i].price!,
                              image: state.data[i].image!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is CartItemsFailed) {
                return Container(child: Text(state.msg.message));
              } else {
                return Container();
              }
            },
          ),
          // EmptyCartContainer(),
          bottomNavigationBar: false != 0
              ? BottomAppBar(
                  color: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: CheckoutButton(
                      height: 60,
                      label: "Proceed To Chekout",
                      total: '10',
                      function: () => Get.bottomSheet(
                        MainScreen(),
                        isScrollControlled: true,
                      ),
                    ),
                  ),
                  elevation: 0,
                )
              : Container(
                  height: 1,
                ),
        ),
      ),
    );
  }
}

class EmptyCartContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 70),
            child: Image.asset(
              "assets/images/tab_cart_off.png",
              color: Colors.black12,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Your cart is empty",
            style: TextStyle(
                fontSize: 24,
                color: Appcolors().textColor2,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "You can browse out shop and add items to your shopping cart.",
              style: TextStyle(fontSize: 16, color: Appcolors().textColor2),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          AppRaiseButton(
            height: 60,
            width: 330,
            label: "Start Shopping",
            function: () => Get.back(),
          )
        ],
      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pumpkin/Data/model/category.dart';

import '../../Widgets/common/ItemBox.dart';
import '../../Widgets/common/appbar.dart';
import '../../Widgets/common/appbarLayout.dart';
import '../../Widgets/common/searchBar.dart';
import '../cubit/categories_cubit.dart';

class CategoryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (ctx) => GetIt.instance.get(),
      child: _CategoryDetailScreen(),
    );
  }
}

late CategoriesCubit _bloc;

class _CategoryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryModel category = Get.arguments;
    _bloc = context.read();
    _bloc.fetchCategoryProducts(category.id);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
            child: SimpleAppBar(
              title: category.name,
            ),
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    children: [
                      Expanded(child: SearchBar()),
                      Image.asset(
                        "assets/images/filter_icon.png",
                        height: 17,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: BlocBuilder<CategoriesCubit, CategoriesState>(
                      builder: (context, state) {
                        if (state is SingleCategoryProgress) {
                          return CircularProgressIndicator();
                        } else if (state is SingleCategorySuccesed) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: GridView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: (7 / 10),
                                  ),
                                  itemCount: state.data.length,
                                  itemBuilder: (ctx, i) => ItemBox(
                                    product: state.data[i],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (state is SingleCategoryFailed) {
                          return Text(state.msg.message);
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

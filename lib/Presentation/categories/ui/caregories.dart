import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pumpkin/Presentation/categories/cubit/categories_cubit.dart';
import 'package:pumpkin/Presentation/categories/widgets/categoryItem.dart';

import '../../Widgets/common/appbar.dart';
import '../../Widgets/common/appbarLayout.dart';
import '../../Widgets/common/searchBar.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (ctx) => GetIt.instance.get(),
      child: _CategoriesScreen(),
    );
  }
}

class _CategoriesScreen extends StatelessWidget {
  late CategoriesCubit _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = context.read();
    _bloc.fetch();
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
            child: MainAppbar(
              title: "Categories",
            ),
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                SearchBar(),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: BlocBuilder<CategoriesCubit, CategoriesState>(
                            builder: (context, state) {
                              if (state is CategoriesProgress) {
                                return CircularProgressIndicator();
                              } else if (state is CategoriesSuccesed) {
                                return ListView.separated(
                                  separatorBuilder: (ctx, i) => SizedBox(
                                    height: 12,
                                  ),
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.data.length,
                                  itemBuilder: (ctx, i) =>
                                      CategoryItem(state.data[i]),
                                );
                              } else if (state is CategoriesFailed) {
                                return Text(state.msg.message);
                              } else
                                return SizedBox();
                            },
                          ),
                        ),
                      ],
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

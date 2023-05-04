import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pumpkin/Presentation/products/cubit/products_cubit.dart';
import 'package:pumpkin/Presentation/test/cubit/test_cubit.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (ctx) => GetIt.instance.get(),
      child: _FAQScreen(),
    );
  }
}

class _FAQScreen extends StatelessWidget {
  late ProductsCubit _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = context.read();
    _bloc.fetch();
    return Scaffold(
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccesed) {
            return Padding(
                padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
                child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (ctx, i) => Column(
                          children: [
                            Text(state.data[i].name),
                            Image.memory(state.data[i].image)
                          ],
                        )));
          } else if (state is TestInProgress) {
            return const CircularProgressIndicator();
          } else if (state is ProductFailed) {
            return Text(state.msg.message);
          } else
            return Container();
        },
      ),
    );
  }
}

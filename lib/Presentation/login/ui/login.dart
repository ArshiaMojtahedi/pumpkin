import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pumpkin/App/colors.dart';
import 'package:pumpkin/Presentation/Widgets/common/button.dart';
import 'package:pumpkin/Presentation/login/cubit/login_cubit.dart';

import '../../../App/textFieldDecoration.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (ctx) => GetIt.instance.get(),
      child: _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen({super.key});

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  late LoginCubit _bloc;

  bool isEnable = false;

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  _updateButton() {
    var _ise = (_emailController.text.toString().isNotEmpty &&
        _passwordController.text.toString().isNotEmpty);

    setState(() {
      isEnable = _ise;
    });
  }

  @override
  void initState() {
    _emailController.addListener(_updateButton);
    _passwordController.addListener(_updateButton);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read();

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginInProgress) {
        } else if (state is LoginFailed) {
          Get.snackbar('Error', state.msg.message);
          print('sda');
        } else if (state is LoginSuccesed) {
          Get.snackbar('Success', state.data.clientCode);
          print('sddsada');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (prv, crt) => (crt is LoginInProgress),
                builder: (ctx, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: _emailController,
                        // obscureText: true,
                        // focusNode: focusNode,
                        keyboardType: TextInputType.emailAddress,

                        decoration: textFieldDecoration('Email'),
                        onChanged: null,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: _passwordController,
                        obscureText: true,
                        // focusNode: focusNode,
                        keyboardType: TextInputType.emailAddress,

                        decoration: textFieldDecoration('Password'),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      AppRaiseButton(
                        label: 'LOGIN',
                        isRound: false,
                        height: 58,
                        width: double.infinity,
                        function: isEnable
                            ? () => _bloc.login(
                                _emailController.text, _passwordController.text)
                            : null,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(color: Appcolors().textColor1)),
                          Text('Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(color: Appcolors().green)),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

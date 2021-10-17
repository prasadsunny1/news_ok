import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ok/app/router/router_constants.dart';
import 'package:news_ok/login/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News OK'),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoggingInState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Logging In')));
          } else if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Log in Successful')));
            Navigator.of(context)
                .pushReplacementNamed(RouterConstants.homePage);
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Center(
          child: TextButton(
            child: const Text('Login with Google'),
            onPressed: () {
              //Call login
              BlocProvider.of<LoginCubit>(context).signInWithGoogle();
            },
          ),
        ),
      ),
    );
  }
}

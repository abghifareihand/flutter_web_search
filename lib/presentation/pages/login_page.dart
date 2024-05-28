import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/core/components/loading_spinkit.dart';
import 'package:wifipos_web/presentation/pages/home_page.dart';
import 'package:wifipos_web/presentation/bloc/login_bloc/login_bloc.dart';
import '../../core/components/input_field.dart';
import '../../core/components/responsive_widget.dart';
import '../../core/constants/fonts.dart';
import '../../data/models/login_request_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0CBAF9),
      ),
      body: ResponsiveWidget(
        mobile: buildSmallScreenContent(),
        tablet: buildMediumScreenContent(),
        desktop: buildLargeScreenContent(),
      ),
    );
  }

  Widget buildSmallScreenContent() {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: AppFont.blackText.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 20),
            buildEmailField(),
            buildPasswordField(),
            const SizedBox(height: 20),
            buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget buildMediumScreenContent() {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: AppFont.blackText.copyWith(
                fontSize: 30,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 20),
            buildEmailField(),
            buildPasswordField(),
            const SizedBox(height: 20),
            buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget buildLargeScreenContent() {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: AppFont.blackText.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 20),
            buildEmailField(),
            buildPasswordField(),
            const SizedBox(height: 20),
            buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return InputField.email(
      controller: _emailController,
      label: 'Email',
    );
  }

  Widget buildPasswordField() {
    return InputField.password(
      controller: _passwordController,
      label: 'Password',
    );
  }

  Widget buildLoginButton() {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0CBAF9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Handle login action
          final loginRequest = LoginRequestModel(
            email: _emailController.text,
            password: _passwordController.text,
          );
          context.read<LoginBloc>().add(LoginUser(loginRequest: loginRequest));
        },
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoaded) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.loginResponse.message),
                  backgroundColor: Colors.green,
                ),
              );
            }

            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const LoadingSpinkit(
                color: Colors.white,
              );
            }

            return const Text('Login');
          },
        ),
      ),
    );
  }
}

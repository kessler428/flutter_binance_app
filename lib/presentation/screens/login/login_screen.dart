import 'package:binance_implementation/config/themes/primary_config.dart';
import 'package:binance_implementation/presentation/providers/login/login_provider.dart';
import 'package:binance_implementation/presentation/screens/home/home_screen.dart';
import 'package:binance_implementation/presentation/screens/register/register_screen.dart';
import 'package:binance_implementation/presentation/widgets/buttons/naivgation_button.dart';
import 'package:binance_implementation/presentation/widgets/inputs/input_form_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {

  static const String path = '/login';
  static const String pathName = 'login';

  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}


class LoginScreenState extends ConsumerState<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      ref.read(loginProvider.notifier).setEmail(emailController.text);
    });

    passwordController.addListener(() {
      ref.read(loginProvider.notifier).setPassword(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryConfig.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(  
              key: formKey,
              child: Column(
                children: [
              
                  const SizedBox(height: 80),
                      
                  const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                      
                  const SizedBox(height: 20),
                      
                  InputFormField(
                    title: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){

                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }

                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Invalid email format';
                      }

                      return null;
                    },
                  ),
                      
                  const SizedBox(height: 20),
                      
                  InputFormField(
                    title: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){

                      if (
                        !value!.contains(RegExp(r'[A-Z]')) ||
                        !value.contains(RegExp(r'[a-z]')) ||
                        !value.contains(RegExp(r'[0-9]')) ||
                        !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                      ){
                        return 'Password must contain at least one uppercase letter, one lowercase letter, one number and one special character';
                      }

                      if (value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                      
                  const SizedBox(height: 20),
                      
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: NavigationButton(
                      btnName: 'Ingresar',
                      txtColor: Colors.black,
                      onPressed: () {

                        if (formKey.currentState!.validate()) {  
                          print('*** Login ***');
                          print('User: ${ref.read(loginProvider).email}');
                          print('Password: ${ref.read(loginProvider).password}');
                          context.go(HomeScreen.path);
                        }

                      },
                    ),
                  ),
                      
                  const SizedBox(height: 20),
                      
                  _buildDivider(),
                      
                  const SizedBox(height: 20),
                      
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.go(RegisterScreen.path);
                      },
                      child: const Text(
                        'Create a Binance Account',
                        style: TextStyle(
                          color: PrimaryConfig.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Flexible(
          flex: 2,
          child: Divider(
            color: PrimaryConfig.textColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'or',
            style: TextStyle(color: PrimaryConfig.textColor, fontSize: 16),
          ),
        ),
        Flexible(
          flex: 2,
          child: Divider(
            color: PrimaryConfig.textColor,
          ),
        ),
      ],
    );
  }
}
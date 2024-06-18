import 'package:binance_implementation/config/themes/primary_config.dart';
import 'package:binance_implementation/presentation/providers/register/register_provider.dart';
import 'package:binance_implementation/presentation/screens/home/home_screen.dart';
import 'package:binance_implementation/presentation/screens/login/login_screen.dart';
import 'package:binance_implementation/presentation/widgets/buttons/naivgation_button.dart';
import 'package:binance_implementation/presentation/widgets/inputs/input_form_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerStatefulWidget {

  static const String path = '/register';
  static const String pathName = 'register';

  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}


class RegisterScreenState extends ConsumerState<RegisterScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      ref.read(registerProvider.notifier).setEmail(emailController.text);
    });

    passwordController.addListener(() {
      ref.read(registerProvider.notifier).setPassword(passwordController.text);
    });

    confirmPasswordController.addListener(() {
      ref.read(registerProvider.notifier).setConfirmPassword(confirmPasswordController.text);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  const SizedBox(height: 80),
                      
                  const Center(
                    child: Text(
                      'Register',
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
                    validator: (value){

                      if(value!.isEmpty){
                        return 'Email is required';
                      }

                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Invalid email format';
                      }

                      return null;
                    
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                      
                  const SizedBox(height: 20),
                      
                  InputFormField(
                    title: 'Password',
                    controller: passwordController,
                    validator: (value){

                      if (
                        !value!.contains(RegExp(r'[A-Z]')) ||
                        !value.contains(RegExp(r'[a-z]')) ||
                        !value.contains(RegExp(r'[0-9]')) ||
                        !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                      ){
                        return 'Password must contain at least one uppercase letter, one lowercase letter, one number and one special character';
                      }

                      if(value.isEmpty){
                        return 'Password is required';
                      }
                      return null;
                    
                    },
                    obscureText: true,
                  ),
                      
                  const SizedBox(height: 20),
              
                  InputFormField(
                    title: 'Confirm Password',
                    controller: confirmPasswordController,
                    validator: (value){

                      if(value!.isEmpty){
                        return 'Confirm Password is required';
                      }

                      if(value != passwordController.text){
                        return 'Passwords do not match';
                      }

                      return null;
                    
                    },
                    obscureText: true,
                  ),
                      
                  const SizedBox(height: 20),
                      
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: NavigationButton(
                      btnName: 'Register',
                      txtColor: Colors.black,
                      onPressed: () {

                        if (formKey.currentState!.validate()) {  
                          print('*** Register ***');
                          print('User: ${ref.read(registerProvider).email}');
                          print('Password: ${ref.read(registerProvider).password}');
                          print('Confirm Password: ${ref.read(registerProvider).confirmPassword}');
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
                        context.go(LoginScreen.path);
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: PrimaryConfig.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
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
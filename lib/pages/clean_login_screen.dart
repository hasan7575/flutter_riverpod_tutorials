import 'package:flutter/material.dart';
import 'package:flutter_tutorials/utils/constants.dart';
import 'package:flutter_tutorials/widgets/Sign_up_link.dart';
import 'package:flutter_tutorials/widgets/login_card.dart';


class CleanLoginScreen extends StatefulWidget {
  const CleanLoginScreen({super.key});

  @override
  State<CleanLoginScreen> createState() => _CleanLoginScreenState();
}

class _CleanLoginScreenState extends State<CleanLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              SizedBox(height: 40),
              LoginCard(emailController: emailController,passwordController: passwordController,isLoading: isLoading,onLogin: _handleLogin),
              SizedBox(height: 30),

              SignUpLink()
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildTitle() {
    return Container(
      child: Text(
        'Login',
        style: AppTextStyles.title,
      ),
    );
 }

  void _handleLogin() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      _showSuccessMessage();
    });
  }

  void _showSuccessMessage() {
    _showMessage("Login Successful!",AppColors.success);
  }

  void _showMessage(String message,Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

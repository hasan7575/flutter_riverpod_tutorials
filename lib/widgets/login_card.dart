import 'package:flutter/material.dart';
import 'package:flutter_tutorials/utils/constants.dart';
import 'package:flutter_tutorials/widgets/custom_button.dart';
import 'package:flutter_tutorials/widgets/custom_text_field.dart';

class LoginCard extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;

  final VoidCallback onLogin;

  const LoginCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildCardDecoration(),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            CustomTextField(
              controller: passwordController,
              label: 'Email',
              hint: 'Enter your Email',
              icon: Icons.email,
            ),

            SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              hint: 'Enter your password',
              obscureText: true,
              icon: Icons.lock,
            ),
            SizedBox(height: 30),//==========================

            CustomButton(isLoading: isLoading,text: 'Login',onPressed:onLogin ,),
            SizedBox(height: 20),
            _buildForgetPassword(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: AppSizes.shadowBlur,
          offset: AppSizes.shadowOffset,
        ),
      ],
    );
  }

 Widget _buildForgetPassword() {
    return Text(
      'Forgot Password?',
      style: TextStyle(
        color: Color(0xFF2196F3),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
 }
}

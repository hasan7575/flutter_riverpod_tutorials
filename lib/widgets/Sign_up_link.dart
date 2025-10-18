import 'package:flutter/material.dart';
import 'package:flutter_tutorials/utils/constants.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: AppTextStyles.bodyText,
          ),
          GestureDetector(
            onTap: () {

            },
            child: Text(
              'Sign Up',
              style: AppTextStyles.linkTextBold,
            ),
          ),
        ],
      ),
    );
  }
}

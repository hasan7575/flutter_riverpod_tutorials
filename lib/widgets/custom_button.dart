import 'package:flutter/material.dart';
import 'package:flutter_tutorials/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback? onPressed;
  const CustomButton({super.key,required this.isLoading,required this.text,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
        ),
        child:
        isLoading
            ? _buildLoadingIndicator()
            : _buildButtonText(),
      ),
    );
  }

 Widget _buildLoadingIndicator() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
    );
 }

 Widget _buildButtonText() {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
 }
}

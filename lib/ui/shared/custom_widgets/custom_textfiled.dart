import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/utils.dart';

class CustomTextField extends StatefulWidget {
  final IconData  prefIcon;
  final IconData?  suffIcon;
  final Color colorIcon;
  final Color? suffColor;
  final String hintText;
    final double? maxHeight;
  final double? maxWidth;
  
  const CustomTextField({super.key, required this.prefIcon, required this.colorIcon, required this.hintText, this.maxHeight, this.maxWidth, this.suffIcon, this.suffColor});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        constraints: BoxConstraints(
        maxHeight:widget. maxHeight ?? screenHeight(2),
        maxWidth: widget.maxWidth ?? screenWidth(1.1),
      ),
        
        fillColor: AppColors.TextFieldcolor,
        filled: true,
 border: OutlineInputBorder(
          borderSide: BorderSide(
            
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),      
    suffixIcon:widget.suffIcon!=null? Icon(
      widget.suffIcon,
      color:widget. suffColor,
    ):SizedBox() ,
        prefixIcon:   widget.prefIcon != null
              ? Icon(
                 widget. prefIcon,
                  color:widget.colorIcon,
                )
              : SizedBox(),
              hintText: widget.hintText,
              hintStyle: TextStyle(
            color: AppColors.TextgrayColor,
            // fontSize: size.width / 18,
          ),
             
      ),
    ) ;
  }
}
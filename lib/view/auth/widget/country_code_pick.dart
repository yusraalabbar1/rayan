import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:rayan/utils/constant/color.dart';

Container countryPick() {
  return Container(
    child: CountryCodePicker(
      onChanged: print,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'IT',
      favorite: ['+39', 'FR'],
      // optional. Shows only country name and flag
      showCountryOnly: true,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: true,
      // optional. aligns the flag and the Text left
      alignLeft: false,
      searchStyle: TextStyle(color: MyColors.color4),
      flagWidth: 35,
      flagDecoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: const DecorationImage(
          image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        // borderRadius: BorderRadius.circular(12),
      ),
      textStyle: TextStyle(color: MyColors.color4),
      // dialogTextStyle: TextStyle(color: Color(0xff707070)),
    ),
  );
}

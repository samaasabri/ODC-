import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/main.dart';
import 'package:odc/viewmodel/bloc/authentication/register/reg_cubit.dart';

import '../../view/pages/Home.dart';

Widget textForm(String name ,TextEditingController  controller,String name2) {
  return TextFormField(
    controller: controller,
    validator:(val){
      if(val!.isEmpty)
        {
          return name2;
        }
    } ,
    decoration: InputDecoration(

      labelText: name,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: HexColor.fromHex('dc802d'))),
    ),
  );
}

Widget textFormwithIcon(String name ,IconData icon,TextEditingController  controller,String name2,Function function) {
  return TextFormField(

    controller: controller,
    obscureText: true,
    validator:(val){
      if(val!.isEmpty)
      {
        return name2;
      }
    } ,
    decoration: InputDecoration(
      suffixIcon: GestureDetector(
        child: InkWell(onTap: (){function();},
            child: Icon(icon,color: HexColor.fromHex('dc802d'),)),
      ),
      suffixIconColor:Colors.deepOrange ,
      labelText: name,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: HexColor.fromHex('dc802d'))),
    ),
  );
}
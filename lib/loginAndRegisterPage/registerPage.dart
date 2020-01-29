import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

class register extends StatelessWidget
{
  String phoneNumber,password,userName;
  var registerUrl="http://123.56.108.246:8080/registerUser";
  void phoneInput(String str)
  {
    phoneNumber = str;
    print(phoneNumber);
  }void passwordInput(String str)
  {
    password = str;
    print(password);

  }void userNameInput(String str)
  {
    userName = str;
    print(userName);
  }
  @override
  Widget build(BuildContext context) {
    postHttp() async
    {
      var response;
      Dio dio = new Dio();
      response = await dio.post(registerUrl,data:{"phoneNum":phoneNumber,"password":password,});
      print(response);
      final  responseJson = json.decode(response.data);
      Map<String, dynamic> newTitle = responseJson ;
      print(newTitle);
      if(response.statusCode==200)
      {
        print("注册成功了");
      }
      else
      {
        print("注册失败了 "+response.statusCode.toString());
      }
    }
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage("assets/images/ic_cover2.jpg"),
                  fit:BoxFit.cover,
                )
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Image.asset("assets/images/ic_app.png"),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon:Icon(Icons.text_fields),
                        labelText:'请输入注册用手机号'),
                    onChanged: phoneInput,
                    autofocus: false,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon:Icon(Icons.text_fields),
                        labelText:'请输入您的密码'),
                    onChanged: passwordInput,
                    autofocus: false,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon:Icon(Icons.text_fields),
                        labelText:'请确认您的密码'),
                    onChanged: passwordInput,
                    autofocus: false,
                  ),
                  RaisedButton(
                      onPressed: (){
                        postHttp();
                        print("你按下了注册按钮");
                      },
                      child:Text(
                        '立即注册',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 255, 255)
                        ),
                      ),
                      color: const Color(0x1296db)
                  )
                ]
            )
        )
    );
  }
}
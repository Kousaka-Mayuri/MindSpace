import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class login1 extends StatelessWidget
{
  var loginUrl="http://123.56.108.246:8080/loginUser";
  String num,password;
  void phonenumInput(String str)
  {
    num = str;
    print(num);
  }
  void passwordInput(String str)
  {
    password = str;
    print(password);
  }

  @override
  Widget build(BuildContext context)
  {
    postData() async{
      var params = {
        "phoneNum": num,
        "password": password,
      };
      Dio dio = new Dio();
      Response response;
      print('phoneNum:'+num+'password:'+password);
      response = await dio.post(loginUrl,queryParameters: params);
      print(response);
      final responseJson = json.decode(response.data);
      Map <String,String> myData = responseJson;
      print(myData);
      if(response.statusCode==200)
      {
        print("登录成功了");
      }
      else{
        print("登录失败了 "+ response.statusCode.toString());
      }
    }
    return Scaffold(

        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage("assets/images/ic_cover2.jpg"),
                    fit:BoxFit.cover
                )
            ),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>
                [
                  Image.asset("assets/images/ic_app.png"),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon:Icon(Icons.text_fields),
                        labelText:'请输入手机号'),
                    onChanged: phonenumInput,
                    autofocus: false,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon:Icon(Icons.text_fields),
                        labelText:'请输入密码'),
                    onChanged: passwordInput,
                    autofocus: false,
                  ),
                  RaisedButton(
                    onPressed : (){
                      postData();
                    },
                    child:Text(
                      '立即登录',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 255, 255, 255)
                      ),
                    ),
                    color: const Color(0x1296db),
                  ),
                ]
            )
        )
    );
  }
}
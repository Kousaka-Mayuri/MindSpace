import 'package:flutter/material.dart';
import 'package:flutter_mindspace/loginAndRegisterPage/registerPage.dart';
import 'package:flutter_mindspace/loginAndRegisterPage/loginPage.dart';

class Login extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(


        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage("assets/images/ic_cover2.jpg"),
                  fit:BoxFit.cover,
                )
            ),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[

                  Image.asset("assets/images/ic_app.png"),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login1()));
                    },
                    child:Text(
                      '通过手机号登录',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 255, 255, 255)
                      ),
                    ),
                    color: const Color(0x1296db),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child:Text(
                      '立即注册您的账号',
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
import 'package:flutter/material.dart';
import 'package:fluttertalk03/ui/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red
      ),
      home: _cekLogin(),
      routes: {
        "/login": (context) => LoginScreen(),
        // "/register": (context) => LoginScreen(),
        "/profile": (context) => ProfileScreen(),
      },
    );
  }
}

class _cekLogin extends StatefulWidget {
  @override
  __cekLoginState createState() => __cekLoginState();
}

class __cekLoginState extends State<_cekLogin> {

  @override
  void initState() { 
    super.initState();
    getPref();
  }

  getPref()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final username = pref.getString('username');

    if(username != null){
        Future.delayed(const Duration(microseconds: 2000),(){
          Navigator.pushNamedAndRemoveUntil(context, "/profile", (Route<dynamic>routes)=>false);
        });
    }else{
        Future.delayed(const Duration(microseconds: 2000),(){
          Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic>routes)=>false);
        });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: splashscreen(),
    );
  }

  Widget splashscreen(){
    return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Icon(Icons.local_drink,size: 60,color: Colors.white,),
                SizedBox(height: 10,),

                Text(
                  "Splash",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/orange.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: SizedBox(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 40, top: 50),
                  child: const Text(
                    'Create\nAccount',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    class DetailsLogin extends StatefulWidget {
  DetailsLogin({required this.username, required this.platform});

  final String username;
  final String platform;

  @override
  State<DetailsLogin> createState() => _DetailsLoginState();
}

class _DetailsLoginState extends State<DetailsLogin> {
bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Login Page',
              style: TextStyle(color: Colors.black,
                  fontSize: 35,fontWeight: FontWeight.bold
              ),
              maxLines: Duration.microsecondsPerDay,
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.red),
              ),
              SizedBox(height: 16),
              Text(
                "Username: ${widget.username}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Platform: ${widget.platform}",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),

                const SizedBox(
                  height: 30,
                ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: (){
                          print("before $isShowPassword");
                         if(isShowPassword) {
                           isShowPassword = false;
                         }else{
                           isShowPassword = true;
                         }
                          print("After $isShowPassword");
                         setState(() {

                         });


                        },
                          child: isShowPassword ? Icon(Icons.visibility_off ,):Icon(Icons.remove_red_eye,)),
                    ),
                  ),



                SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            child: const Text(//press ctrl
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xff4c505b),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

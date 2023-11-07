import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  final TextEditingController emailController =TextEditingController();

  final TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context){
    return SafeArea(child:
    Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(51, 204, 0, 1.0),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                  ),
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/3/3c/Logo_sklepu_odzie%C5%BCowego_4U.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 130, 0, 0),

              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text("Sign In",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text("Welcome back, Phan Trang",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),

                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Vui lòng nhập Email");
                              }
                              if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Vui lòng nhập Email hợp lệ");
                              }
                              return null;
                            },
                            onSaved: (value){
                              emailController.text = value!;
                            },
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              RegExp regex = RegExp(r".{6,}$");
                              if (value!.isEmpty) {
                                return ('Mật khẩu bắt buộc để đăng nhập');
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Mật khẩu không hợp lệ");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              passwordController.text = value!;
                            },
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                print("Đăng nhập thành công");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(51, 204, 0, 1.0),
                            ),
                            child: SizedBox(
                              width: 2000,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("or sign in with")
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30,),
                              Image.network("https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 30,),
                              Image.network("https://cdn-icons-png.flaticon.com/512/2111/2111466.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(width: 30,),
                              Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/LINE_New_App_Icon_%282020-12%29.png/600px-LINE_New_App_Icon_%282020-12%29.png?20210104132415",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),

                              Text("Sign Up",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.greenAccent)),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

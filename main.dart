import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController =
  TextEditingController();

  int _gioiTinh = 0;

  void setGioiTinh(Object? value) {
    setState(() {
      _gioiTinh = int.parse(value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
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
                  margin: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                  width: 500,
                  height: 900,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                          child: Text("Sign Up",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ))),

                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text('Traveler'),
                              leading: Radio(
                                  value: 0,
                                  groupValue: _gioiTinh,
                                  onChanged: setGioiTinh),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text('Guide'),
                              leading: Radio(
                                  value: 1,
                                  groupValue: _gioiTinh,
                                  onChanged: setGioiTinh),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text("First Name",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  SizedBox(
                                    width: 170,
                                  ),

                                  Text("Last Name",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),

                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Phan',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Trang',
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Country",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Country',
                                  ),
                                  controller: addressController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Vui lòng nhập Address");
                                    }
                                  },
                                  onSaved: (value) {
                                    addressController.text = value!;
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                  ),
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
                                  onSaved: (value) {
                                    emailController.text = value!;
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                ),
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
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Password has more than 6 letter",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Confirm Password",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                ),
                                controller: confirmpasswordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ('Mật khẩu bắt buộc để đăng nhập');
                                  }
                                  if (passwordController.text !=
                                      confirmpasswordController.text) {
                                    return ("Mật khẩu không trùng khớp");
                                  }

                                  return null;
                                },
                                onSaved: (value) {
                                  confirmpasswordController.text = value!;
                                },
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("By Signing Up, you agree to our"),

                                  Text(" Terms & Conditions",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromRGBO(
                                      51, 204, 0, 1.0))),

                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    const pragma("Đăng nhập thành công");
                                  }
                                },
                                style:
                                ElevatedButton.styleFrom(primary: Color.fromRGBO(51, 204, 0, 1.0)),
                                child: const SizedBox(
                                  width: 400,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account?"),

                                  Text(" Sign In",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromRGBO(51, 204, 0, 1))),

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

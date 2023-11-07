import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(51, 204, 0, 1.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15,left: 15),
            child: Image.network(
              'https://i.imgur.com/rOz8bky.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
              width: 800,
              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text(
                      'Forgot Password',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text(
                      'Input your email,we will send you an \ninstructon to reset your password',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Vui lòng nhâp Email');
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ('Vui lòng nhập Email hợp lệ');
                              }
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                const pragma("Gửi email thành công");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(51, 204, 0, 1.0)),
                            child: const SizedBox(
                              width: 400,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Back to'),
                              Text(' Sign in',style: TextStyle(color: Colors.green),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

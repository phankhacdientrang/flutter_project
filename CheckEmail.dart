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
                    color: Color.fromRGBO(229, 96, 96, 1),
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
                          child: Text("Check Email",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                          child: Text("Please check your email for the instructions on how to reset your password.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 30,),
                            Image.network("https://png.pngtree.com/png-vector/20190728/ourlarge/pngtree-email-mail-message-text-flat-color-icon-vector-icon-png-image_1620997.jpg",
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Back to"),

                                Text(" Sign In",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromRGBO(229, 96, 96, 1))),


                              ],
                            ),

                          ],
                        ),
                      ]
                  ),

                ),

              ],
            )
        )
    ),
    );


  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 TextEditingController emailcon =TextEditingController();

 TextEditingController passwordcon =TextEditingController();

 var formKey = GlobalKey<FormState>();

 bool isPassword =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
          'My App'
                ),
       centerTitle: true,
         backgroundColor: Colors.blueAccent,
        leading : const Icon(Icons.list),
           actions: [
             IconButton(onPressed: () {
                 print("ok");
                },
               icon:const Icon(Icons.search),)
                       ],
      ),
      body : Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child:Column(
                  children: [
                   const Text("Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight:FontWeight.bold,
                    ),
                    ),
                   const  SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: emailcon,
                     keyboardType: TextInputType.emailAddress,
                     decoration: InputDecoration(
                       hintText: "Email",
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         borderSide: BorderSide(color:Colors.blueAccent,width: 2.0),
                       ),
                       prefix: Icon(
                           Icons.email ),
                     ),
                      onChanged: (value) { },
                      validator: (value)  {
                        if (value!.isEmpty)
                          {
                            return "email must be not empty";
                          }
                        return null;
                      },
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 70,
                      child: TextFormField(
                       controller: passwordcon,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color:Colors.blueAccent,),
                          ),
                          prefix: Icon(
                              Icons.lock ),
                          suffix: IconButton(
                            icon: isPassword? Icon(Icons.visibility_off ):Icon(Icons.visibility ),
                            onPressed:(){
                              setState(() {
                                isPassword =!isPassword;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {},
                        validator: (value)  {
                          if (value!.isEmpty)
                          {
                            return "password must be not empty";
                          }
                          return null;
                        },
                      ),
                    ),
                   const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height:50 ,
                        width: double.infinity,
                        color: Colors.blueAccent,
                        child: MaterialButton(onPressed:()
                        {
                          if(formKey.currentState!.validate())
                          {
                            print(emailcon.text);
                            print(passwordcon.text);
                          }
                        },
                                      child: const Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                                      ),
                                      ),
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(" Don't have an account ?"),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(emailcon.text);
                          },
                          child: const Text("Register",
                            style: TextStyle(color: Colors.white,),

                          ),
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                          ) ,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
      );

  }
}


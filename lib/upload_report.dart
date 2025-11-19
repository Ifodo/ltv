import 'package:flutter/material.dart';
import 'package:lagostv/upload_file_page.dart';

class UploadReport extends StatefulWidget {
  const UploadReport({super.key});

  @override
  State<UploadReport> createState() => _UploadReportState();
}

class _UploadReportState extends State<UploadReport> {

  final myControllerName = TextEditingController();
  final myControllerLocation = TextEditingController();
  final myControllerDescription = TextEditingController();
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
          title: const Text('Community Report', style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Container(
              margin:
              const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 15.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Center(
                      child: Text("Share Experience from your Neighbourhood", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold))),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        const SizedBox(height: 30.0),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person_add, color: Colors.black),
                            labelText: "Full Name",
                            labelStyle: const TextStyle(fontSize: 19.0),
                            //hintText: "full name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (val) => val!.isEmpty ? 'Enter your Full Name' : null,
                          controller: myControllerName,
                          onChanged: (value) {
                            if(value.isNotEmpty){
                              _formkey.currentState?.validate();
                            }
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.add_location, color: Colors.black),
                            //prefix: Icon(Icons.person_add),
                            //prefixText: "Name: ",
                            //prefixStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                            labelText: "Location",
                            labelStyle: const TextStyle(fontSize: 19.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (val) => val!.isEmpty ? 'Enter your Location' : null,
                          controller: myControllerLocation,
                          onChanged: (value) {
                            if(value.isNotEmpty){
                              _formkey.currentState?.validate();
                            }
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          autofocus: true,
                          maxLines: 8,
                          keyboardType: TextInputType.text,
                          //textInputAction: TextInputAction.send,
                          //textAlign: TextAlign.right,
                          //obscureText: true, // for password text
                          autocorrect: true,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.description, color: Colors.black),
                            //prefix: Icon(Icons.person_add),
                            //prefixText: "Name: ",
                            //prefixStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                            labelText: "Description",
                            labelStyle: const TextStyle(fontSize: 19.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (val) => val!.isEmpty ? 'Enter a description' : null,
                          controller: myControllerDescription,
                          onChanged: (value) {
                            if(value.isNotEmpty){
                              _formkey.currentState?.validate();
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: screenWidth,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(const Color(
                                  0xffb61005)),
                              elevation: WidgetStateProperty.all(10.0),
                              side: WidgetStateProperty.all(const BorderSide(color: Colors.black26)),
                              shape: WidgetStateProperty.all<OutlinedBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),
                                    ),
                                  )),
                            ),
                            onPressed: () {
                              if(_formkey.currentState!.validate()){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UploadFilePage(
                                          name: myControllerName.text,
                                          location: myControllerLocation.text,
                                          description: myControllerDescription.text,
                                        )));
                              }
                            },
                            child: const Text('Continue', style: TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
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

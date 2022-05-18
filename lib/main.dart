import 'package:flutter/material.dart';
import 'userModel.dart';
import 'apiService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late List<UserModel> _userModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();

  }

  void _getUser() async{
    _userModel = (await ApiService().getUser())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => {
    setState(() {

    })
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "REST Api ",
      home: Scaffold(
        appBar: AppBar(title: Text("API Service"),),
        body: _userModel == null || _userModel.isEmpty ? const Center(
          child: CircularProgressIndicator(),
        ) :
            ListView.builder(itemCount: _userModel!.length,itemBuilder: (context,index){
              return Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(_userModel![index].id.toString()),
                        Text(_userModel![index].username.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(_userModel![index].email.toString()),
                        // Text(_userModel![index].street.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            })
      ),
    );
  }
}

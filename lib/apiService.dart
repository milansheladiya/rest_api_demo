import 'dart:developer';

import 'package:http/http.dart' as http;
import 'userModel.dart';
import 'Constants.dart';

class ApiService{

  Future<List<UserModel>?> getUser() async {
    try{
      var url = Uri.parse(ApiConstatnts.baseURL+ApiConstatnts.usersEndPoint);
      var response = await http.get(url);

      if(response.statusCode == 200){
        List<UserModel> _model = welcomeFromJson(response.body);
        print(_model.length);
        return _model;
      }
    }catch(e){
        log(e.toString());
    }
  }

}
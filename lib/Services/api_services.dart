import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt/Constants/api_consts.dart';
import 'package:http/http.dart'as http;

import '../Models/models_model.dart';
class ApiServices{
  static Future<List<ModelsModel>> getModels()async{
    try{
      var response = await http.get(Uri.parse("$BASE_URL/models"),
      headers: {
        'Authorization': 'Bearer $API_KEY'
      });
      Map jsonResponse = jsonDecode(response.body);

      if(jsonResponse['error']!=null){
       // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
     // print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]){
        temp.add(value);
        //log("temp $value");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    }
    catch(error){
      log("error $error");
      rethrow;
    }
  }

  // send message
  static Future<List<ModelsModel>> sendMessage({
    required String message, required String modelId
})async{
    try{
      var response = await http.post(
          Uri.parse("$BASE_URL/completions"),
          headers: {
            'Authorization': 'Bearer $API_KEY',
            "Content-Type" : "application/json"
          });
      Map jsonResponse = jsonDecode(response.body);

      if(jsonResponse['error']!=null){
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]){
        temp.add(value);
        //log("temp $value");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    }
    catch(error){
      log("error $error");
      rethrow;
    }
  }

}
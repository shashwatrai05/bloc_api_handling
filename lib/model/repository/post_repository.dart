import 'package:bloc_api_handling/model/postModel.dart';
import 'package:bloc_api_handling/model/repository/api.dart';
import 'package:dio/dio.dart';

class PostRepository{

  API api=API();
  Future<List<PostModel>> fetchPost() async{
    try{
      Response response=await api.sendRequest.get("/posts");
      List<dynamic> postMaps= response.data;
      return postMaps.map((postmap) => PostModel.fromJson(postmap)).toList();
    }catch(ex){
      throw(ex);
    }
  }
}
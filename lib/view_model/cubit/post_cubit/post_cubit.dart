import 'package:bloc_api_handling/model/postModel.dart';
import 'package:bloc_api_handling/model/repository/post_repository.dart';
import 'package:bloc_api_handling/view_model/cubit/post_cubit/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit(): super(PostLoadingState()){
    fetchPosts();
  }
  

  PostRepository postRepository=PostRepository();

  void fetchPosts() async{
    try{
      List<PostModel> posts=await postRepository.fetchPost();
      emit(PostLoadedState(posts));
    }
    on DioError catch(ex){
      emit(PostErrorState(ex.message.toString()));
    }
  }
}
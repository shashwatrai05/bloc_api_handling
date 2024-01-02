import 'package:bloc_api_handling/view_model/cubit/post_cubit/post_cubit.dart';
import 'package:bloc_api_handling/view_model/cubit/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Handling'),
      ),
      body: SafeArea(child: 
      BlocConsumer<PostCubit,PostState>(
        listener: (context, state){
          if(state is PostErrorState){
            SnackBar snackBar=SnackBar(content: Text(state.error),
            backgroundColor: Colors.red,);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },

        builder: (context,state){
        if(state is PostLoadingState){
          return Center(child: CircularProgressIndicator());
        }

        if(state is PostLoadedState){
          return ListView.builder(
            itemBuilder:(context,index){
              return ListTile(
                title: Text(state.post[index].title.toString()),
                subtitle: Text(state.post[index].body.toString()),
              );
            } );
        }
        return Center(
          child: Text("An error Occured"),
        );
        

      },
      )
      
      
      )
    );
  }
}
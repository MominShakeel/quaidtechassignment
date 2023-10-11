import 'package:flutter/material.dart';
import 'package:quaidtech/Screens/HomeScreen/APICubit/apiCubit.dart';
import 'package:quaidtech/Screens/HomeScreen/APICubit/apiState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quaidtech/Screens/HomeScreen/APIDate/Models/photosModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      body: BlocBuilder<PhotosCubit,PhotosState>(
        builder: (context,state) {

          if(state is PhotosLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PhotosLoadedState) {
            return PhotosListView(state.photos);
          }
          return Center(child: Text('No Date'),);

        }
      ),
    );
  }

  Widget PhotosListView(List<PhotosModel> photos){
    return ListView.builder(

      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {

        PhotosModel photo = photos[index];

        return Container(
          decoration: BoxDecoration(border: Border.all()),
          child: ListTile(
leading: Text(photo.id.toString()),
            title: Text(photo.title.toString()),
            subtitle: SizedBox(height: 100,child: Image.network(photo.url.toString()),),


          ),
        );
      },


    );
  }
}

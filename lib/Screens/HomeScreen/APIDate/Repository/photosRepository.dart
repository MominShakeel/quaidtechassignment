import 'dart:developer';

import 'package:quaidtech/Screens/HomeScreen/APIDate/Models/photosModel.dart';

import 'Api/api.dart';

class PhotosRepository{

  API api = API();

  Future<List<PhotosModel>> fetchPhotos()async{
    
    try{
      var response = await api.sendRequest.get("/photos");
      List <dynamic> photosMaps = response.data;
      return photosMaps.map((photosMap) => PhotosModel.fromJson(photosMap)).toList();
    }catch(e){
      throw e;
      
    }

    

  }
}
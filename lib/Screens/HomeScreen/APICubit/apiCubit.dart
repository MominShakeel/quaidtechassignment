import 'package:quaidtech/Screens/HomeScreen/APIDate/Models/photosModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../APIDate/Repository/photosRepository.dart';
import 'apiState.dart';

class PhotosCubit extends Cubit<PhotosState>{

  PhotosCubit():super(PhotosLoadingState());

  PhotosRepository photosRepository = PhotosRepository();

  Future<void> fetchPhotos() async {



    try{
      List<PhotosModel> photos = await photosRepository.fetchPhotos();
      emit(PhotosLoadedState(photos));
    }
    catch(e){
      emit(PhotosErrorState(e.toString()));

    }
  }

}
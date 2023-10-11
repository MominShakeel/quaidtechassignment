
import 'package:quaidtech/Screens/HomeScreen/APICubit/apiCubit.dart';

import '../APIDate/Models/photosModel.dart';

abstract class PhotosState{

}

class PhotosLoadingState extends PhotosState{

}
class PhotosLoadedState extends PhotosState{
  final List<PhotosModel> photos;
  PhotosLoadedState(this.photos);

}
class PhotosErrorState extends PhotosState{

  final String error;
  PhotosErrorState(this.error);

}


abstract class ShopStates {}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavBarState extends ShopStates{}

class ShopChangesliderState extends ShopStates{}

//Get User
class ShopGetUserLoadingState extends ShopStates{}
class ShopGetUserSuccessState extends ShopStates{}
class ShopGetUserErrorState extends ShopStates{}

//Add To Cart
class ShopAddToCartloadState extends ShopStates{}
class ShopAddToCartSuccessState extends ShopStates{}
class ShopAddToCartErrorState extends ShopStates{}

//Register
class ShopRegisterLoadingState extends ShopStates{}
class ShopRegisterSuccessState extends ShopStates{}
class ShopRegisterErrorState extends ShopStates
{
  final String error;
  ShopRegisterErrorState(this.error);

}

class ShopCreateUserSuccessState extends ShopStates{}

//Login
class ShopLoginLoadingState extends ShopStates{}
class ShopLoginSuccessState extends ShopStates {}
class ShopLoginErrorState extends ShopStates
{
  final String error;
  ShopLoginErrorState(this.error);

}

class ShopChangePasswordIconState extends ShopStates{}

//Image
class AddImageSuccessState extends ShopStates{}
class AddImageErrorState extends ShopStates{}
class TypeState extends ShopStates{}
class UploadImageSuccessState extends ShopStates{}
class UploadImageErrorState extends ShopStates{}

//Add Lap
class AddLapLoadingState extends ShopStates{}
class AddLapSuccessState extends ShopStates{}
class AddLapErrorState extends ShopStates{}

//Get Laps
class FindLapLoadState extends ShopStates{}
class FindLapSuccessState extends ShopStates{}
class FindLapErrorState extends ShopStates{}

//Delete Lap
class DeleteLapLoadingState extends ShopStates{}
class DeleteLapSuccessState extends ShopStates{}
class DeleteLapErrorState extends ShopStates{}

//Update Lap
class UpdateLapLoadingState extends ShopStates{}
class UpdateLapSuccessState extends ShopStates{}
class UpdateLapErrorState extends ShopStates{}

//Update User
class UpdateUserLoadingState extends ShopStates{}
class UpdateUserSuccessState extends ShopStates{}
class UpdateUserErrorState extends ShopStates{}

//Change Password
class UpdatePassLoadingState extends ShopStates{}
class UpdatePassSuccessState extends ShopStates{}
class UpdatePassErrorState extends ShopStates{}

//Recover Password
class RecoverLoadState extends ShopStates{}
class RecoverSuccessState extends ShopStates{}
class RecoverErrorState extends ShopStates{}

//Get Cart
class GetCartLoadState extends ShopStates{}
class GetCartSuccessState extends ShopStates{}
class GetCartErrorState extends ShopStates{}


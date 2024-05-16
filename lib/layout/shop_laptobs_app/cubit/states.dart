abstract class ShopStates {}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavBarState extends ShopStates{}

class ShopGetUserLoadingState extends ShopStates{}

class ShopGetUserSuccessState extends ShopStates{}

class ShopGetUserErrorState extends ShopStates{}

class ShopGetLaptobLoadingState extends ShopStates{}

class ShopGetLaptobSuccessState extends ShopStates{}

class ShopGetLaptobErrorState extends ShopStates{}

class ShopAddToCartSuccessState extends ShopStates{}

class ShopAddToCartErrorState extends ShopStates{}


class ShopRegisterLoadingState extends ShopStates{}

class ShopRegisterSuccessState extends ShopStates{}

class ShopRegisterErrorState extends ShopStates
{
  final String error;
  ShopRegisterErrorState(this.error);

}

class ShopCreateUserSuccessState extends ShopStates{}

// class ShopRegisterChangePasswordIconState extends ShopStates{}



class ShopLoginLoadingState extends ShopStates{}

class ShopLoginSuccessState extends ShopStates {}

class ShopLoginErrorState extends ShopStates
{
  final String error;
  ShopLoginErrorState(this.error);

}

class ShopChangePasswordIconState extends ShopStates{}


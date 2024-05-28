abstract class ShopStates {}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavBarState extends ShopStates{}
class ShopChangesliderState extends ShopStates{}

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

/////////image////
class addimagesuccessstate extends ShopStates{}
class addimageerrorstate extends ShopStates{}
class typestate extends ShopStates{}
class uploadimagesuccessstate extends ShopStates{}
class uploadimageerrorstate extends ShopStates{}

/////addlap
class addlaploadingstate extends ShopStates{}
class addlapsuccessstate extends ShopStates{}
class addlaperrorstate extends ShopStates{}

//////getlaps
class findlaploadstate extends ShopStates{}
class findlapsuccessstate extends ShopStates{}
class findlaperrorstate extends ShopStates{}

/////delete
class deletelaploadingstate extends ShopStates{}
class deletelapsuccessstate extends ShopStates{}
class deletelaperrorstate extends ShopStates{}

//////update
class updatelaploadingstate extends ShopStates{}
class updatelapsuccessstate extends ShopStates{}
class updatelaperrorstate extends ShopStates{}

/////updateuser
class updateuserloadingstate extends ShopStates{}
class updateusersuccessstate extends ShopStates{}
class updateusererrorstate extends ShopStates{}

/////changepassword
class updatepassloadingstate extends ShopStates{}
class updatepasssuccessstate extends ShopStates{}
class updatepasserrorstate extends ShopStates{}

/////recoverpass

class recoverloadstate extends ShopStates{}
class recoversuccessstate extends ShopStates{}
class recovererrorstate extends ShopStates{}






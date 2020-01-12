
import 'package:flutter/cupertino.dart';

enum EActions{
  Login,
  UnLogin,
  Increase
}

@immutable
class LoginState {
  bool isLogined;


  get loginStatus=>isLogined;

  LoginState(this.isLogined);
  LoginState.initState():isLogined=false;
}

@immutable
class CountState{
  int _index;
  CountState(this._index);
  get countIndex=>_index;

  CountState.initState(){
    _index=0;
  }

}



CountState countReduce(CountState state,dynamic action){
  if(action==EActions.Increase){
    return CountState(state.countIndex+1);
  }
  return state;
}
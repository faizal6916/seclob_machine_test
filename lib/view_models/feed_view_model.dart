import 'package:flutter/material.dart';
import 'package:secolab_test/services/feed_services.dart';
import '../models/user_error.dart';

import '../models/feed_model.dart';
import '../services/api_status.dart';

class FeedViewModel extends ChangeNotifier{
  bool _loading = false;
  // List<Feed> _feed = [];
  Feed _feed = Feed();
  UserError _userError = UserError();
  bool get loading => _loading;
  Feed get feed => _feed;
  UserError get userError => _userError;
  FeedViewModel(){
    getFeed();
    
  }

   setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }
  setFeed(Feed feed){
    _feed =feed;
  }
  setUserError(UserError userError) {
    _userError = userError;
  }
  getFeed() async{
   setLoading(true);
   var response = await FeedServices.getFeed();
   print(response.runtimeType);
   if (response is Success) {
      print('success');
      print(response.response.runtimeType);
      setFeed(response.response as Feed);
    }
    if (response is Failure) {
      print('failure');
      UserError userError =
          UserError(code: response.code, errorMessage: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
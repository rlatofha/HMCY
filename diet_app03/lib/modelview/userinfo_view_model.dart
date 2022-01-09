import 'package:diet_app/model/diary.dart';

class userInfoViewModel {
  late Diary diary;

  userInfoViewModel({required this.diary});
 
  String get email {
    return diary.email;
  }
  String get formattedDate{
    return diary.formattedDate;
  }
  String get diarycontent{
    return diary.diarycontent;
  }
  String get breakfast {
    return diary.breakfast;
  }
  String get lunch {
    return diary.lunch;
  }
  String get dinner {
    return diary.dinner;
  }
  int get waterAmount {
    return diary.waterAmount;
  }
  String get health {
    return diary.health;
  }

  
}
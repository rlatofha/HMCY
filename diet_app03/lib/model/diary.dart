

class Diary{
  // 아이디, 날짜, 다이어리 내용, 감사한일, 물 리터, 운동기록 
  late String email;
  late String formattedDate;
  late String diarycontent;
  late String workcontent;
  late int waterAmount;
  late String health;
  late String breakfast;
  late String lunch;
  late String dinner;

  Diary({
    required this.email, required this.formattedDate, required this.diarycontent, required this.workcontent, 
    required this.breakfast, required this.lunch, required this.dinner,
    required this.waterAmount, required this.health
    
  });

   Diary.fromMap(Map<String, dynamic> res)
    :
        email = res["email"],
        formattedDate = res["formattedDate"],
        diarycontent = res["diarycontent"],
        workcontent = res["workcontent"],
        breakfast = res["breakfast"],
        lunch = res["lunch"],
        dinner = res["dinner"],
        waterAmount = res["waterAmount"],
        health = res["health"];
       
  Map<String, Object?> toMap() {
    return {
      'email': email,
      'formattedDate': formattedDate,
      'diarycontent': diarycontent,
      'workcontent': workcontent,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'waterAmount': waterAmount,
      'health': health,
      
    };
  }




  
}
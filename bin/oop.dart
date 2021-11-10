class Student{
  // Variable 
  String name   = "";
  String family = "";
  int    age    = 0;
  int    _phone  = 0;

  //Seter
  set phonNumber_set(var value)=> this._phone = value;

  // Geter
  get phonNumber_get=> (this._phone);


// Methods
  void info(){
    print("\n $name \n $family \n $age \n $_phone \n");
  }

}
/////////////////////////////////////////////////////
class Information{

  String name     = "";
  String family   = "";
  int    age      = 0;
  String phone    = "";

  hello(){
    print("Hello $name");
  }

}
//////////////////////////////////////////
class Skill extends Information{

  message(){
    print("\n $name : $family \n");
  }
}
//////////////////////////////////////////
class Education extends Skill{


}
//////////////////////////////////////////
class Vehicle{
  String model = "";
  int year  = 0;
  //
  Vehicle(this.model , this.year);

  //
  String showText(){
    return("Hello Fucking World!");
  }
}
//////////////////////////////////////////
class Car extends Vehicle{
  int price = 0;
  //
  Car(String model , int year , this.price) :super(model,year);
  
  //
  String showInputs(){
    return("\n the Car Model is : $model it Produced In $year and price is $price");
  }

  //
  @override
  String showText(){
    return("Hello from $model");
  }
  
}
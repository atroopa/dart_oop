class Student{
  String name   = "";
  String family = "";
  int    age    = 0;
  int    _phone  = 0;

  //Seter
  set phonNumber_set(var value){
    this._phone = value;
  }

  // Geter
  get phonNumber_get{
    return (this._phone);
  }


// Methods
  void info(){
    print("\n $name \n $family \n $age \n $_phone \n");
  }

}
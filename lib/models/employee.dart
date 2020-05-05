class Employee{

  String firstName;
  String age;
  String adress;
  String sex;
  
  Employee(this.firstName,this.age,this.adress,this.sex);
  
   Employee.fromMap(Map map) {
    firstName = map[firstName];
    age = map[age];
    adress = map[adress];
    sex = map[sex];
  }
}
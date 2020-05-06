class Employee{

  String firstName;
  String age;
  String adress;
  String sex;
  String description;
  String createIn;
  int id;
  
  Employee(this.firstName,this.age,this.adress,this.sex,this.description,this.createIn);
  
   Employee.fromMap(Map map) {
    firstName = map[firstName];
    age = map[age];
    adress = map[adress];
    sex = map[sex];
    description = map[description];
    createIn = map[createIn];
  }
}
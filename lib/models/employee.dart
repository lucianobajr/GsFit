class Employee{

  String firstName;
  String age;
  String adress;
  String sex;
  String description;
  String createIn;
  int id;
  
  Employee(this.firstName,this.age,this.adress,this.sex,this.description,this.createIn);
  
   Employee.map(Map map) {
    firstName = map[firstName];
    age = map[age];
    adress = map[adress];
    sex = map[sex];
    description = map[description];
    createIn = map[createIn];
    id = map[id];
  }

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
    mapa["firstname"] = firstName;
    mapa["age"] = age;
    mapa["adress"] = adress;
    mapa["sex"] = sex;
    mapa["description"] = description;
    mapa["createIn"] =createIn;
    if (id != null) {
      mapa["id"] = id;
    }
    return mapa;
  }

  Employee.fromMap(Map<String, dynamic> mapa) {
    this.firstName = mapa["firstname"];
    this.age = mapa["age"];
    this.adress=mapa["adress"];
    this.sex=mapa["sex"];
    this.description=mapa["description"];
    this.createIn=mapa["createIn"];
    this.id = mapa["id"];
  }

    String url(int age, int index) {
    String base = 'assets/images/';

    if (age < 12) {
      //child
      base = base + 'child-';
    } else if (age >= 12 && age < 20) {
      //adolescence
      base = base + 'adolescence-';
    } else if (age >= 20 && age < 35) {
      //adult
      base = base + 'adult-';
    } else if (age >= 35 && age < 50) {
      //mildlife
      base = base + 'mildlife-';
    } else {
      //mature
      base = base + 'mature-';
    }

    if (index == 1) {
      base = base + 'female.png';
    } else {
      base = base + 'male.png';
    }
    return base;
  }
}
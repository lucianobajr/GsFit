class Employee {
  String firstName;
  String age;
  String adress;
  String sex;
  String description;
  String createIn;
  String height;
  String neck;
  String bicepsL;
  String chest;
  String forearmL;
  String waist;
  String legL;
  String calfL;
  String weight;
  String shoulders;
  String bicepsR;
  String abs;
  String forearmR;
  String glutes;
  String legR;
  String calfR;
  int id;

  Employee(
      this.firstName,
      this.age,
      this.adress,
      this.sex,
      this.description,
      this.createIn,
      this.height,
      this.neck,
      this.bicepsL,
      this.chest,
      this.forearmL,
      this.waist,
      this.legL,
      this.calfL,
      this.weight,
      this.shoulders,
      this.bicepsR,
      this.abs,
      this.forearmR,
      this.glutes,
      this.legR,
      this.calfR);

  Employee.map(Map map) {
    firstName = map[firstName];
    age = map[age];
    adress = map[adress];
    sex = map[sex];
    description = map[description];
    createIn = map[createIn];
    height = map[height];
    neck = map[neck];
    bicepsL = map[bicepsL];
    chest = map[chest];
    forearmL = map[forearmL];
    waist = map[waist];
    legL = map[legL];
    calfL = map[calfL];
    weight = map[weight];
    shoulders = map[shoulders];
    bicepsR = map[bicepsR];
    abs = map[abs];
    forearmR = map[forearmR];
    glutes = map[glutes];
    legR = map[legR];
    calfR = map[calfR];
    id = map[id];
  }

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
    mapa["firstname"] = firstName;
    mapa["age"] = age;
    mapa["adress"] = adress;
    mapa["sex"] = sex;
    mapa["description"] = description;
    mapa["createIn"] = createIn;
    mapa["height"] = height;
    mapa["neck"] = neck;
    mapa["bicepsL"] = bicepsL;
    mapa["chest"] = chest;
    mapa["forearmL"] = forearmL;
    mapa["waist"] = waist;
    mapa["legL"] = legL;
    mapa["calfL"] = calfL;
    mapa["weight"] = weight;
    mapa["shoulders"] = shoulders;
    mapa["bicepsR"] = bicepsR;
    mapa["abs"] = abs;
    mapa["forearmR"] = forearmR;
    mapa["glutes"] = glutes;
    mapa["legR"] = legR;
    mapa["calfR"] = calfR;
    if (id != null) {
      mapa["id"] = id;
    }
    return mapa;
  }

  Employee.fromMap(Map<String, dynamic> mapa) {
    this.firstName = mapa["firstname"];
    this.age = mapa["age"];
    this.adress = mapa["adress"];
    this.sex = mapa["sex"];
    this.description = mapa["description"];
    this.createIn = mapa["createIn"];
    this.height = mapa["height"];
    this.neck = mapa["neck"];
    this.bicepsL = mapa["bicepsL"];
    this.chest = mapa["chest"];
    this.forearmL = mapa["forearmL"];
    this.waist = mapa["waist"];
    this.legL = mapa["legL"];
    this.calfL = mapa["calfL"];
    this.weight = mapa["weight"];
    this.shoulders = mapa["shoulders"];
    this.bicepsR = mapa["bicepsR"];
    this.abs = mapa["abs"];
    this.forearmR = mapa["forearmR"];
    this.glutes = mapa["glutes"];
    this.legR = mapa["legR"];
    this.calfR =mapa["calfR"];
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

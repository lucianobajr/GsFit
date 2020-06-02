class Employee {
  String firstName;
  String age;
  String adress;
  String sex;
  String description;
  String createIn;
  String payment;
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
  String dataStart;
  String dataEnd;
  String january;
  String february;
  String march;
  String april;
  String may;
  String june;
  String july;
  String august;
  String september;
  String october;
  String november;
  String december;
  String dataJanuary;
  String dataFebruary;
  String dataMarch;
  String dataApril;
  String dataMay;
  String dataJune;
  String dataJuly;
  String dataAugust;
  String dataSeptember;
  String dataOctober;
  String dataNovember;
  String dataDecember;
  int id;

  Employee(
    this.firstName,
    this.age,
    this.adress,
    this.sex,
    this.description,
    this.createIn,
    this.payment,
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
    this.calfR,
    this.dataStart,
    this.dataEnd,
    this.january,
    this.february,
    this.march,
    this.april,
    this.may,
    this.june,
    this.july,
    this.august,
    this.september,
    this.october,
    this.november,
    this.december,
    this.dataJanuary,
    this.dataFebruary,
    this.dataMarch,
    this.dataApril,
    this.dataMay,
    this.dataJune,
    this.dataJuly,
    this.dataAugust,
    this.dataSeptember,
    this.dataOctober,
    this.dataNovember,
    this.dataDecember,
  );

  Employee.map(Map map) {
    firstName = map[firstName];
    age = map[age];
    adress = map[adress];
    sex = map[sex];
    description = map[description];
    createIn = map[createIn];
    payment = map[payment];
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
    dataStart = map[dataStart];
    dataEnd = map[dataEnd];
    january = map[january];
    february = map[february];
    march = map[march];
    april = map[april];
    may = map[may];
    june = map[june];
    july = map[july];
    august = map[august];
    september = map[september];
    october = map[october];
    november = map[november];
    december = map[december];
    dataJanuary = map[dataJanuary];
    dataFebruary = map[dataFebruary];
    dataMarch = map[dataMarch];
    dataApril = map[dataApril];
    dataMay = map[dataMay];
    dataJune = map[dataJune];
    dataJuly = map[dataJuly];
    dataAugust = map[dataAugust];
    dataSeptember = map[dataSeptember];
    dataOctober = map[dataOctober];
    dataNovember = map[dataNovember];
    dataDecember = map[dataDecember];
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
    mapa["payment"] = payment;
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
    mapa["dataStart"] = dataStart;
    mapa["dataEnd"] = dataEnd;
    mapa["january"] = january;
    mapa["february"] = february;
    mapa["march"] = march;
    mapa["april"] = april;
    mapa["may"] = may;
    mapa["june"] = june;
    mapa["july"] = july;
    mapa["august"] = august;
    mapa["september"] = september;
    mapa["october"] = october;
    mapa["november"] = november;
    mapa["december"] = december;
    mapa["dataJanuary"] = dataJanuary;
    mapa["dataFebruary"] = dataFebruary;
    mapa["dataMarch"] = dataMarch;
    mapa["dataApril"] = dataApril;
    mapa["dataMay"] = dataMay;
    mapa["dataJune"] = dataJune;
    mapa["dataJuly"] = dataJuly;
    mapa["dataAugust"] = dataAugust;
    mapa["dataSeptember"] = dataSeptember;
    mapa["dataOctober"] = dataOctober;
    mapa["dataNovember"] = dataNovember;
    mapa["dataDecember"] = dataDecember;
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
    this.payment = mapa["payment"];
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
    this.calfR = mapa["calfR"];
    this.dataStart = mapa["dataStart"];
    this.dataStart = mapa["dataEnd"];
    this.january = mapa["january"];
    this.february = mapa["february"];
    this.march = mapa["march"];
    this.april = mapa["april"];
    this.may = mapa["may"];
    this.june = mapa["june"];
    this.july = mapa["july"];
    this.august = mapa["august"];
    this.september = mapa["september"];
    this.october = mapa["october"];
    this.november = mapa["november"];
    this.december = mapa["december"];
    this.dataJanuary = mapa["dataJanuary"];
    this.dataFebruary = mapa["dataFebruary"];
    this.dataMarch = mapa["dataMarch"];
    this.dataApril = mapa["dataApril"];
    this.dataMay = mapa["dataMay"];
    this.dataJune = mapa["dataJune"];
    this.dataJuly = mapa["dataJuly"];
    this.dataAugust = mapa["dataAugust"];
    this.dataSeptember = mapa["dataSeptember"];
    this.dataOctober = mapa["dataOctober"];
    this.dataNovember = mapa["dataNovember"];
    this.dataDecember = mapa["dataDecember"];
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

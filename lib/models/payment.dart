class Payment {
  String firstName;
  String age;
  String adress;
  String sex;
  String description;
  String createIn;
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

  Payment(
    this.firstName,
    this.age,
    this.adress,
    this.sex,
    this.description,
    this.createIn,
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

  Payment.map(Map map) {
    firstName = map[firstName];
    age = map[age];
    adress = map[adress];
    sex = map[sex];
    description = map[description];
    createIn = map[createIn];
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
  }

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
    mapa["firstName"] = firstName;
    mapa["age"] = age;
    mapa["adress"] = adress;
    mapa["sex"] = sex;
    mapa["description"] = description;
    mapa["createIn"] = createIn;
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
    return mapa;
  }

  Payment.from(Map<String, dynamic> mapa) {
    this.firstName = mapa["firstName"];
    this.age = mapa["age"];
    this.adress = mapa["adress"];
    this.sex = mapa["sex"];
    this.description = mapa["description"];
    this.createIn = mapa["createIn"];
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
  }
}

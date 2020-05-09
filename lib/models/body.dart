class Body {
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

  Body(
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

  Body.map(Map map) {
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
  }

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
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
    return mapa;
  }
}

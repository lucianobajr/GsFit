import 'package:gsfit/screens/appointments_page.dart';
import 'package:gsfit/screens/newPerson_page.dart';
import 'package:gsfit/screens/main_page.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => MainPage());
    register<NewPersonPage>(() => NewPersonPage());
    register<AppointmentsPage>(() => AppointmentsPage());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DetailModel extends _DetailModel
    with RealmEntity, RealmObjectBase, RealmObject {
  DetailModel(
    String name,
  ) {
    RealmObjectBase.set(this, 'name', name);
  }

  DetailModel._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<DetailModel>> get changes =>
      RealmObjectBase.getChanges<DetailModel>(this);

  @override
  DetailModel freeze() => RealmObjectBase.freezeObject<DetailModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DetailModel._);
    return const SchemaObject(
        ObjectType.realmObject, DetailModel, 'DetailModel', [
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class FinanceModel extends _FinanceModel
    with RealmEntity, RealmObjectBase, RealmObject {
  FinanceModel(
    ObjectId id,
    String userId,
    String title,
    String spend,
    String description,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'spend', spend);
    RealmObjectBase.set(this, 'description', description);
  }

  FinanceModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'user_id') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get spend => RealmObjectBase.get<String>(this, 'spend') as String;
  @override
  set spend(String value) => RealmObjectBase.set(this, 'spend', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  Stream<RealmObjectChanges<FinanceModel>> get changes =>
      RealmObjectBase.getChanges<FinanceModel>(this);

  @override
  FinanceModel freeze() => RealmObjectBase.freezeObject<FinanceModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(FinanceModel._);
    return const SchemaObject(
        ObjectType.realmObject, FinanceModel, 'FinanceModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.string, mapTo: 'user_id'),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('spend', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
    ]);
  }
}

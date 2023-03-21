// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ShoppingListModel extends _ShoppingListModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ShoppingListModel(
    ObjectId id,
    String userId,
    String title,
    String description,
    String spend,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'spend', spend);
  }

  ShoppingListModel._();

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
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String get spend => RealmObjectBase.get<String>(this, 'spend') as String;
  @override
  set spend(String value) => RealmObjectBase.set(this, 'spend', value);

  @override
  Stream<RealmObjectChanges<ShoppingListModel>> get changes =>
      RealmObjectBase.getChanges<ShoppingListModel>(this);

  @override
  ShoppingListModel freeze() =>
      RealmObjectBase.freezeObject<ShoppingListModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ShoppingListModel._);
    return const SchemaObject(
        ObjectType.realmObject, ShoppingListModel, 'ShoppingListModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.string, mapTo: 'user_id'),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('spend', RealmPropertyType.string),
    ]);
  }
}

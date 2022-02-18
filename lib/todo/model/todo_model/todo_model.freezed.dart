// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
class _$TodoModelTearOff {
  const _$TodoModelTearOff();

  _TodoModel call(
      {String id = '',
      String todo = '',
      bool isDone = false,
      @JsonKey(ignore: true) DocumentReference<Object?>? documentReference}) {
    return _TodoModel(
      id: id,
      todo: todo,
      isDone: isDone,
      documentReference: documentReference,
    );
  }

  TodoModel fromJson(Map<String, Object?> json) {
    return TodoModel.fromJson(json);
  }
}

/// @nodoc
const $TodoModel = _$TodoModelTearOff();

/// @nodoc
mixin _$TodoModel {
  String get id => throw _privateConstructorUsedError;
  String get todo => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DocumentReference<Object?>? get documentReference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String todo,
      bool isDone,
      @JsonKey(ignore: true) DocumentReference<Object?>? documentReference});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res> implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  final TodoModel _value;
  // ignore: unused_field
  final $Res Function(TodoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? todo = freezed,
    Object? isDone = freezed,
    Object? documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ));
  }
}

/// @nodoc
abstract class _$TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$TodoModelCopyWith(
          _TodoModel value, $Res Function(_TodoModel) then) =
      __$TodoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String todo,
      bool isDone,
      @JsonKey(ignore: true) DocumentReference<Object?>? documentReference});
}

/// @nodoc
class __$TodoModelCopyWithImpl<$Res> extends _$TodoModelCopyWithImpl<$Res>
    implements _$TodoModelCopyWith<$Res> {
  __$TodoModelCopyWithImpl(_TodoModel _value, $Res Function(_TodoModel) _then)
      : super(_value, (v) => _then(v as _TodoModel));

  @override
  _TodoModel get _value => super._value as _TodoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? todo = freezed,
    Object? isDone = freezed,
    Object? documentReference = freezed,
  }) {
    return _then(_TodoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoModel extends _TodoModel with DiagnosticableTreeMixin {
  const _$_TodoModel(
      {this.id = '',
      this.todo = '',
      this.isDone = false,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_TodoModel.fromJson(Map<String, dynamic> json) =>
      _$$_TodoModelFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String todo;
  @JsonKey()
  @override
  final bool isDone;
  @override
  @JsonKey(ignore: true)
  final DocumentReference<Object?>? documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoModel(id: $id, todo: $todo, isDone: $isDone, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('todo', todo))
      ..add(DiagnosticsProperty('isDone', isDone))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.todo, todo) &&
            const DeepCollectionEquality().equals(other.isDone, isDone) &&
            const DeepCollectionEquality()
                .equals(other.documentReference, documentReference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(todo),
      const DeepCollectionEquality().hash(isDone),
      const DeepCollectionEquality().hash(documentReference));

  @JsonKey(ignore: true)
  @override
  _$TodoModelCopyWith<_TodoModel> get copyWith =>
      __$TodoModelCopyWithImpl<_TodoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoModelToJson(this);
  }
}

abstract class _TodoModel extends TodoModel {
  const factory _TodoModel(
      {String id,
      String todo,
      bool isDone,
      @JsonKey(ignore: true)
          DocumentReference<Object?>? documentReference}) = _$_TodoModel;
  const _TodoModel._() : super._();

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$_TodoModel.fromJson;

  @override
  String get id;
  @override
  String get todo;
  @override
  bool get isDone;
  @override
  @JsonKey(ignore: true)
  DocumentReference<Object?>? get documentReference;
  @override
  @JsonKey(ignore: true)
  _$TodoModelCopyWith<_TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

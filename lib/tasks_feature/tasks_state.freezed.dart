// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TasksState {
  AsyncValue<dynamic> get allTasks => throw _privateConstructorUsedError;
  Map<String, int> get tasksWithTimerOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksStateCopyWith<TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
  @useResult
  $Res call({AsyncValue<dynamic> allTasks, Map<String, int> tasksWithTimerOn});
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTasks = null,
    Object? tasksWithTimerOn = null,
  }) {
    return _then(_value.copyWith(
      allTasks: null == allTasks
          ? _value.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as AsyncValue<dynamic>,
      tasksWithTimerOn: null == tasksWithTimerOn
          ? _value.tasksWithTimerOn
          : tasksWithTimerOn // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TasksStateCopyWith<$Res>
    implements $TasksStateCopyWith<$Res> {
  factory _$$_TasksStateCopyWith(
          _$_TasksState value, $Res Function(_$_TasksState) then) =
      __$$_TasksStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<dynamic> allTasks, Map<String, int> tasksWithTimerOn});
}

/// @nodoc
class __$$_TasksStateCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$_TasksState>
    implements _$$_TasksStateCopyWith<$Res> {
  __$$_TasksStateCopyWithImpl(
      _$_TasksState _value, $Res Function(_$_TasksState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTasks = null,
    Object? tasksWithTimerOn = null,
  }) {
    return _then(_$_TasksState(
      allTasks: null == allTasks
          ? _value.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as AsyncValue<dynamic>,
      tasksWithTimerOn: null == tasksWithTimerOn
          ? _value._tasksWithTimerOn
          : tasksWithTimerOn // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$_TasksState with DiagnosticableTreeMixin implements _TasksState {
  const _$_TasksState(
      {this.allTasks = const AsyncValue.loading(),
      final Map<String, int> tasksWithTimerOn = const {}})
      : _tasksWithTimerOn = tasksWithTimerOn;

  @override
  @JsonKey()
  final AsyncValue<dynamic> allTasks;
  final Map<String, int> _tasksWithTimerOn;
  @override
  @JsonKey()
  Map<String, int> get tasksWithTimerOn {
    if (_tasksWithTimerOn is EqualUnmodifiableMapView) return _tasksWithTimerOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tasksWithTimerOn);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksState(allTasks: $allTasks, tasksWithTimerOn: $tasksWithTimerOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksState'))
      ..add(DiagnosticsProperty('allTasks', allTasks))
      ..add(DiagnosticsProperty('tasksWithTimerOn', tasksWithTimerOn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksState &&
            (identical(other.allTasks, allTasks) ||
                other.allTasks == allTasks) &&
            const DeepCollectionEquality()
                .equals(other._tasksWithTimerOn, _tasksWithTimerOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allTasks,
      const DeepCollectionEquality().hash(_tasksWithTimerOn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TasksStateCopyWith<_$_TasksState> get copyWith =>
      __$$_TasksStateCopyWithImpl<_$_TasksState>(this, _$identity);
}

abstract class _TasksState implements TasksState {
  const factory _TasksState(
      {final AsyncValue<dynamic> allTasks,
      final Map<String, int> tasksWithTimerOn}) = _$_TasksState;

  @override
  AsyncValue<dynamic> get allTasks;
  @override
  Map<String, int> get tasksWithTimerOn;
  @override
  @JsonKey(ignore: true)
  _$$_TasksStateCopyWith<_$_TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

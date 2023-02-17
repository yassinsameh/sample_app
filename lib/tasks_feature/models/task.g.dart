// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String,
      createdBy: json['created_by'] as String,
      completedTime:
          const TimestampConverter().fromJson(json['completed_time']),
      title: json['title'] as String,
      timeSpent: json['time_spent'] as int,
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'completed_time':
          const TimestampConverter().toJson(instance.completedTime),
      'title': instance.title,
      'time_spent': instance.timeSpent,
      'status': _$TaskStatusEnumMap[instance.status]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.done: 'done',
};

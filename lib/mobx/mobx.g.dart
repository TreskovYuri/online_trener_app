// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Mobx on _Mobx, Store {
  Computed<List<dynamic>>? _$userExercisesOnFinalComputed;

  @override
  List<dynamic> get userExercisesOnFinal => (_$userExercisesOnFinalComputed ??=
          Computed<List<dynamic>>(() => super.userExercisesOnFinal,
              name: '_Mobx.userExercisesOnFinal'))
      .value;

  late final _$exercisesAtom = Atom(name: '_Mobx.exercises', context: context);

  @override
  List<dynamic> get exercises {
    _$exercisesAtom.reportRead();
    return super.exercises;
  }

  @override
  set exercises(List<dynamic> value) {
    _$exercisesAtom.reportWrite(value, super.exercises, () {
      super.exercises = value;
    });
  }

  late final _$_MobxActionController =
      ActionController(name: '_Mobx', context: context);

  @override
  void setUserExercises(List<dynamic> exercises) {
    final _$actionInfo =
        _$_MobxActionController.startAction(name: '_Mobx.setUserExercises');
    try {
      return super.setUserExercises(exercises);
    } finally {
      _$_MobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentDate(String date) {
    final _$actionInfo =
        _$_MobxActionController.startAction(name: '_Mobx.setCurrentDate');
    try {
      return super.setCurrentDate(date);
    } finally {
      _$_MobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExercises(List<dynamic> exercise) {
    final _$actionInfo =
        _$_MobxActionController.startAction(name: '_Mobx.setExercises');
    try {
      return super.setExercises(exercise);
    } finally {
      _$_MobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exercises: ${exercises},
userExercisesOnFinal: ${userExercisesOnFinal}
    ''';
  }
}

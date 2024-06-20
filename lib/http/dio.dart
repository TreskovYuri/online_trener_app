import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:trener_app/http/exerciseUtills.dart';
import 'package:trener_app/http/http.dart';

FutureAddExercise(Map<String, dynamic> formData) async {
  FormData fd = FormData.fromMap({
    ...formData,
    if (formData['video'] != null && formData['video'] is PlatformFile)
      'video': await MultipartFile.fromFile((formData['video'] as PlatformFile).path!, filename: (formData['video'] as PlatformFile).name),
  });

  try {
    Map<String, dynamic> data = await Session().post1('exercises', fd);
    GetExercise();
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}



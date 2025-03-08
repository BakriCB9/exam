import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/show_data_data_source.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/update_data_data_source.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/repositories/show_data_repo.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/repositories/update_data_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/profile_entity.dart';
@Injectable(as: UpdateDataRepo)
class UpdateDataRepoImpl implements UpdateDataRepo
{

  UpdateData update;

  UpdateDataRepoImpl(this.update);

  @override
  Future<ApiResult<Map<String, dynamic>>> updateData(ProfileEntity entity) {
   return update.update(entity);
  }



}


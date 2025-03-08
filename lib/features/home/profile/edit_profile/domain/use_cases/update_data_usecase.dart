


import 'package:exam_app/features/home/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/repositories/update_data_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api_manager/api_result.dart';

@injectable
class UpdateDataUsecase
{
  UpdateDataRepo repo;

  UpdateDataUsecase(this.repo);
  Future<ApiResult<Map<String,dynamic>>>   call(ProfileEntity entity)
  {
    return repo.updateData(entity);
  }



}

import 'package:exam_app/features/home/profile/edit_profile/domain/entities/show_data_entite.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/repositories/show_data_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api_manager/api_result.dart';

@injectable
class ShowDataUseCase
{
  ShowDataRepo repo;
  ShowDataUseCase(this.repo);
  Future<ApiResult<Map<String,dynamic>>>   call()
  {
    return repo.showData();
  }

}
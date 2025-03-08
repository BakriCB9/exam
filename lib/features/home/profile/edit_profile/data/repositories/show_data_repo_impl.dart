import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/show_data_data_source.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/repositories/show_data_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/show_data_entite.dart';
@Injectable(as: ShowDataRepo)
class ShowDataRepoImpl implements ShowDataRepo
{

  ShowData show;

  ShowDataRepoImpl(this.show);

  @override
  Future<ApiResult<Map<String,dynamic>>>  showData() {

    return show.show();
  }



}


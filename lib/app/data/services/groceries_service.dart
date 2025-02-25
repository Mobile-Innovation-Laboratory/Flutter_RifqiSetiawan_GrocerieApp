import 'package:tubes_motion/app/data/models/data_groceries_model.dart';
import 'package:tubes_motion/app/data/models/groceries_model.dart';
import 'package:tubes_motion/app/data/shared/constanta.dart';

class GroceriesService {
  Future<DataGroceriesModel?> getGroceries() async{
    try{
      final response = await dio.get('$url/products/category/groceries');
      print(response.data);
      if(response.statusCode == 200) {
        return DataGroceriesModel.fromJson(response.data);
      } else {
        throw Exception('API call failed with status code: ${response.statusCode}');
      }

    }catch(e) {
      return throw Exception(e);
    }
  }

  
  Future<GroceriesModel?> getDetailGroceries({required int id}) async {
    try {
      final response = await dio.get('$url/products/$id');
      print(response.data);
      if (response.statusCode == 200) {
        return GroceriesModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  

  // Future<UserModel> loginService({
  //   required String username,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await dio.post(
  //       '$url/auth/login',
  //       data: {
  //         'username': username,
  //         'password': password,
  //       },
  //     );

  //     if (response.statusCode == 200 && response.data != null) {
  //       return UserModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Login failed. Status code: ${response.statusCode}');
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       throw Exception(e.response?.data['message']);
  //     } else {
  //       throw Exception('Network error: ${e.message}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error during login: $e');
  //   }
  // } 
}

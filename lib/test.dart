import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:my_shop/app_components/constants/api.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';
import 'package:path_provider/path_provider.dart';

const adminToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NzQ5NTIwOC0wMjg1LTQwMzQtOWViOC1kNDQ5NWQzY2EwYTgiLCJqdGkiOiIwOGM3NmNlNDg1YmVjY2UxNmMyODk0MDM3NDFkMjZlNzlmMTdmNjk3YmIyOGU2MWNkOTQ0OGFkZGIzZjYwODE1YWIyOWNiMmMxYmE4N2FlMCIsImlhdCI6MTY2MzQxMTc5MC41MTUzODgsIm5iZiI6MTY2MzQxMTc5MC41MTUzOTEsImV4cCI6MTY5NDk0Nzc5MC41MDEzNjIsInN1YiI6IjEiLCJzY29wZXMiOlsiZGFzaGJvYXJkIl19.T3wfbnlmVaYg6XfVHYTAOQuIYmtJV6EL1SMqPT6XhSU7PwEVMar_GVMIxhndZ06XvbKH9CMWqFAAXL1k7erLFGDwdJ46j_U-GB7IB7I-kC467mP87D2rcyS9FOqwkjsGwmYU0bWs7u1JGwRHUdxWCtszFjqfTw5WV-c2KUtgOe4wVSyYxGGziAz2r6uti-QQAr6EjKfGUVC7IOvNIaF0VW2al7Q519XJwbwZpZkTKDdzByLnyrSSbRfzDW6eZ5q_WwoKtu-xLsEw0q5KdWx7QsWKTPjw613j-jCe59dPiaTelleFMb47QAlAArrkNrMzOAqNwDMsoTi6UkHuJ3aOp_4ApFRQRgw1OvHWKfJ1glc6lZQQ7hmCohXnWp3o0M1n2xhmOYGAEnnnHlViWoM7SFtzgw1iq1TCejZzjtWMukrk8nY7mOH5LpuxMxPOlzlphQWr2S-YQARoMKVo1_7qTjyZgpG1u_PzUILAOVNU2tK45H2d_eEcoAyO12MRXldFew3QIQAy6KyQDoa24CA_3cTExhCHn45JAfhya8p0TRohSzSeti7XooaAdPhfszpI3jjSVGrXUZ4Hy6SWyauwlgVxTBHDq39qteAYamTzQCbhUC760VcA4t0_v1N57dMV1P_u-BNtVwTvyeWYQLs7J13Pv8Vuz7zq1E9gmIlfU1o';
const addProductUrl = '/product/store';
final dio = Dio(
  BaseOptions(
    baseUrl: apiUrl,
    headers: {
      'apiKey': apikey,
      'Authorization': 'Bearer $adminToken',
    },
  ),
);

//
//

const categoryId = 1;
const name = 'soso';
const price = 12;
const quantity = 111;
const image = '1.jpg';

Future<void> addProductService() async {
  try {
    File fileImage = await getImageFileFromAssets(image);

    final formData = FormData.fromMap(
      {
        'category_id': categoryId,
        'name': name,
        'price': price,
        'quantity': quantity,
        'description': 'test test test test',
        'images[]': [
          await MultipartFile.fromFile(fileImage.path),
        ],
        'sizes[]': ['small', 'large'],
        'colors[]': [123456, 558833],
      },
    );
    final response = await dio.post(
      addProductUrl,
      data: formData,
    );

    //
    final data = response.data['Data'];
    log(data.toString());
  } on DioError catch (e) {
    log(e.response.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: e.response!.data['Messages'].toString(),
    );
  }
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

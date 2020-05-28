import 'package:slidy/src/utils/object_generate.dart';

String repositoryGenerator(ObjectGenerate obj) => '''
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';

class ${obj.name}Repository extends Disposable {

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }


  //dispose will be called automatically
  @override
  void dispose() {
    
  }

}
  ''';

String repositoryGeneratorModular(ObjectGenerate obj) => '''
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
${obj.hasInterface ? obj.import : ''}

class ${obj.name}Repository extends Disposable ${obj.hasInterface ? 'implements I${obj.name}Repository' : ''} {

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }


  //dispose will be called automatically
  @override
  void dispose() {
    
  }

}
  ''';

String repositoryInterfaceGenerator(ObjectGenerate obj) => '''
abstract class ${obj.name}Repository {
}
  ''';

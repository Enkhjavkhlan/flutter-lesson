import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie/bloc/movie/bloc.dart';
import 'package:movie/bloc/movie/events.dart';
import 'package:movie/global_keys.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/services/api/index.dart';
import 'package:movie/widget/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _bloc = MovieBloc();
  void _onChangeLanguage() {
    final context = GlobalKeys.navigatorKey.currentContext!;
    if (context.locale.languageCode == Locale('mn', 'MN').languageCode) {
      context.setLocale(Locale('en', 'US'));
    } else
      context.setLocale(Locale('mn', "MN"));
  }

  @override
  void initState() {
    super.initState();
  }

  void _onImagePicker(ImageSource source) async {
    XFile? file = await ImagePicker().pickImage(source: source);
    print("file");
    print(file?.name);
  }

  void _onHttpRequist() async {
    _bloc.add(MovieGetAll());
    // final api = ApiService();
    // final data2 = await api.getRequest("/packages/dio", true);
    // print(data2);

    // final dio = Dio();
    // Response data = await dio.get('https://wowkino.in/k/20096');
    // Response data1 = await dio.post('https://wowkino.in/k/20096',
    //     data: MovieModel(id: 1, title: "", imgUrl: '').toJson());
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).devicePixelRatio;
    print(size);
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return provider.isLogged
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _onImagePicker(ImageSource.gallery),
                  child: Text("Зураг"),
                ),
                ElevatedButton(
                  onPressed: () => _onImagePicker(ImageSource.camera),
                  child: Text("Камер"),
                ),
                ElevatedButton(
                  onPressed: _onHttpRequist,
                  child: Text("HTTP Request"),
                ),
                ElevatedButton(
                  onPressed: () => provider.onLogout(),
                  child: Text("Гарах"),
                ),
                SizedBox(
                  width: 75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.red, width: 5))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: _onChangeLanguage,
                    child: Text(context.locale.languageCode),
                  ),
                ),
              ],
            ))
          : Center(
              child: LoginPage(),
            );
    });
  }
}

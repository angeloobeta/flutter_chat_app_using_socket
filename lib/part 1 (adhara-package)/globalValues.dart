import '../model/models/userModel.dart';
import '../model/utilities/functions/socketUtils.dart';

class G {
  static List<UserModel>? dummyUser = [];

  static UserModel? loggedInUser;

  static SocketUtils? socketUtils;

  static void initialDummy() {
    UserModel UserA =
        UserModel(id: 1001, email: "userA@email.com", name: "userA");
    UserModel UserB =
        UserModel(id: 1002, email: "userB@email.com", name: "userB");
    dummyUser!.addAll([UserA, UserB]);
  }

  static List<UserModel> getUsersFor(UserModel userModel) {
    List<UserModel> filteredUser = dummyUser!
        .where((element) => (!element.name!
            .toLowerCase()
            .contains(userModel.name!.toLowerCase())))
        .toList();
    return filteredUser;
  }

  //
  static initSocket() {
    socketUtils ??= SocketUtils();
  }
}

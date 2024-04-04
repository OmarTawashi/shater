import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/contact_model.dart';
import 'package:shater/data/model/contact_store_model.dart';
import 'package:shater/data/repository/contact_repository_remote.dart';
import 'package:shater/domain/usecase/contact_usecase_imp.dart';

class ContactMeController extends BaseController {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  ContactUseCaseImp? _contactUseCaseImp;

  MessgaesResponseModel? _messgaesResponse;
  MessgaesResponseModel? get messgaesResponse => _messgaesResponse;

  ContactStoreModel? _contactStoreModel;
  ContactStoreModel? get contactStoreModel => _contactStoreModel;

  bool? _isAdmin;
  bool? get isAdmin => _isAdmin;

  @override
  void onInit() {
    super.onInit();
    _contactUseCaseImp =
        ContactUseCaseImp(ContactRepositoryRemote(ApiClient()));
    fetchContactList();
  }

  fetchContactList() async {
    updateViewType(ViewType.loading);
    await _contactUseCaseImp?.fetchContactList().then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        _messgaesResponse = r;
        updateViewType(ViewType.success);
      });
      update();
    });
  }

  fetchContactStore(details) async {
    await _contactUseCaseImp?.fetchContactStore(details).then((value) {
      value?.fold((l) {
        // handelError(l);
      }, (r) {
        _contactStoreModel = r;
        // updateViewType(ViewType.success);
      });
      update();
    });
  }

  void sendReplayMessage(int? idParent, String? text) async {
    await _contactUseCaseImp?.sendReplayMessage(idParent, text).then((value) {
      value?.fold((l) {
        // handelError(l);
      }, (r) {});
      update();
    });
  }

  void addMessage() {
    DateTime dateStamp = DateTime.timestamp();
    final replayMessage = ReplayMessage(
      createdAt: dateStamp.toString(),
      text: messageController.text,
      userType: "App\Models\User",
    );
    messgaesResponse?.replies?.add(replayMessage);
    final parent = _messgaesResponse?.details;
    if (parent == null) {
      fetchContactStore(messageController.text);
    } else {
      sendReplayMessage(_messgaesResponse?.id, replayMessage.text);
    }
    if (messgaesResponse?.replies?.contains(replayMessage) == true) {
      messageController.clear();
    }
    update();
  }
}

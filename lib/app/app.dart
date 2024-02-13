import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../repositories/cached_contact_repository.dart';
import '../services/app_db_service.dart';
import '../services/contact_service.dart';
import '../ui/bottom_sheets/add_contact/add_contact_sheet.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/views/contact_details/contact_details_view.dart';
import '../ui/views/contacts/contacts_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: ContactsView),
    MaterialRoute(page: ContactDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AppDbService),
    LazySingleton(classType: ContactService),
    LazySingleton(classType: Uuid),

    // @stacked-service
    LazySingleton(classType: CachedContactRepository),
    // @stacked-repository
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AddContactSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}

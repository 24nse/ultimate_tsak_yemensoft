
import 'package:get/get.dart';
import 'package:ultimate_task/services/api_services1.dart';
import '../models/delivery_bill_model.dart';
import '../services/db_service.dart';

class HomeController extends GetxController {
  final ApiService _api = ApiService();
  final DBService _db = DBService();
var selectedTab = 0.obs;
  var bills = <DeliveryBill>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBills();
  }

  void fetchBills() async {
    try {
      isLoading.value = true;
      final apiData = await _api.getDeliveryBillsItems('1010');

      if (apiData.isNotEmpty) {
        await _db.insertBills(apiData);
        bills.assignAll(apiData);
        Get.snackbar('✅ تم الحفظ', 'تم تحميل الفواتير وحفظها بنجاح');
      } else {
        Get.snackbar('❕ لا توجد بيانات', 'لم يتم تحميل أي فواتير من السيرفر');
      }
    } catch (e) {
      Get.snackbar('❌ خطأ', 'فشل أثناء الحفظ: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  void filterByStatus(int status) async {
    final filtered = await _db.filterByStatus(status);
    bills.assignAll(filtered);
  }
}


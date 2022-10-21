enum OrderStatus {
  Processing,
  inDelievery,
  Completed,
  Canceled,
}

/// 1 => قيد المعالجة
/// 2=> يتم شحنها
/// 3=> الطلب وصل
/// 4=> الادمن رفض الطلب

OrderStatus orderStatusfromNumber(int num) {
  switch (num) {
    case 1:
      return OrderStatus.Processing;

    case 2:
      return OrderStatus.inDelievery;

    case 3:
      return OrderStatus.Completed;

    default:
      return OrderStatus.Canceled;
  }
}

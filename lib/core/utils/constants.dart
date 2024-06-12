class Constants {


  //API ENDPOINTS
 // static const baseUrl = 'https://spotfinder-backend.tekstagearea.com/api/v1';
  static const baseUrl = 'https://haaji.website/user/';
  static const baseUrl1 = 'https://haaji.website/';
  static const reservationbaseUrl = 'https://haaji.website/reservation/';
  static const preSignedBaseUrl = 'https://s3-presigned-svc.tekstagearea.com/api/v1/';


  //S3 presigned url

  static const preSignedHeaderValue = "8b85130e43c1bee65887";

  static const loginUrl = baseUrl + 'verify_haaji_id';
  static const managerLoginUrl = baseUrl1 + 'manager/login';
 // static const attendanceUrl = 'https://haaji.website/events/mark_attendance';
  static const attendanceUrl = baseUrl1 + 'events/mark_attendance';
  static const eventsUrl = baseUrl1 + 'events';
  static const userUrl = baseUrl + 'send_otp';
  static const otpVerifyUrl = baseUrl + 'verify_otp';
  static const sectionDataUrl = reservationbaseUrl + 'sections_data';
  static const bedDataUrl = reservationbaseUrl + 'beds_data';
  static const reserveBedUrl = reservationbaseUrl + 'reserve_bed';

}


# Bài tập lớn - Phát triển ứng dụng với Flutter

## Thông tin sinh viên
- **Họ và tên**: _____Trần Thị Hương Ly____
- **MSSV**: _____2221050523____
- **Lớp**: ______DCCTCLC67B___

## Giới thiệu
Đây là yêu cầu của bài tập lớn cho một trong hai học phần **Phát triển ứng dụng di động đa nền tảng 1 (mã học phần 7080325) và Phát triển ứng dụng cho thiết bị di động + BTL (mã học phần 7080115)**. Sinh viên sẽ xây dựng một ứng dụng di động hoàn chỉnh sử dụng Flutter và Dart, áp dụng các kiến thức đã học về lập trình giao diện người dùng, quản lý trạng thái, tích hợp API hoặc/và CSDL, kiểm thử tự động và CI/CD với GitHub Actions.

## Mục tiêu
Bài tập lớn nhằm:
- Phát triển kỹ năng lập trình giao diện người dùng (UI) với Flutter và ngôn ngữ Dart.
- Hiểu và áp dụng các cách quản lý trạng thái trong ứng dụng Flutter.
- Biết tích hợp ứng dụng với backend hoặc dịch vụ backend thông qua API hoặc CSDL.
- Thực hiện được các thao tác CRUD (Create, Read, Update, Delete) cơ bản với dữ liệu.
- Biết áp dụng kiểm thử tự động để đảm bảo chất lượng ứng dụng.
- Biết áp dụng CI/CD với GitHub Actions để tự động hóa quy trình kiểm thử và triển khai.

## Yêu cầu ứng dụng
### 1. Chức năng CRUD
- Ứng dụng cần cung cấp đầy đủ các chức năng CRUD (Create, Read, Update, Delete) cho một đối tượng bất kỳ (ví dụ: sản phẩm, người dùng, ghi chú, sự kiện, v.v.).
- Mỗi đối tượng cần có ít nhất các thuộc tính cơ bản như:
  - **id**: Định danh duy nhất cho mỗi đối tượng.
  - **title**: Mô tả ngắn gọn hoặc tên của đối tượng.
  - **Trạng thái hoặc thuộc tính bổ sung**: Ví dụ, trạng thái hoàn thành cho công việc, hoặc số lượng cho sản phẩm.
- Sử dụng `dart data class generator extension` hoặc các công cụ tương tự để tạo ra các class model. Hiểu rõ về data model được sử dụng trong ứng dụng bao gồm các thuộc tính, phương thức và cách sử dụng.

### 2. Giao diện người dùng
- Thiết kế giao diện đơn giản, dễ sử dụng, thân thiện với người dùng.
- Yêu cầu các màn hình cơ bản:
  - Danh sách các đối tượng.
  - Chi tiết đối tượng (có thể tạo, sửa, xóa).
  - Cập nhật thông tin cá nhân và thay đổi mật khẩu (nếu ứng dụng có chức năng xác thực).

### 3. Tích hợp API
Ứng dụng cần tích hợp với backend qua các API phù hợp với loại lưu trữ dữ liệu đã chọn (ví dụ: Firebase, RESTful API, GraphQL, MySQL v.v.). Cụ thể:
**- Nếu sử dụng Firebase hoặc các dịch vụ tương tự**
  -	Thiết lập Firebase Authentication nếu ứng dụng yêu cầu đăng nhập và xác thực người dùng.
  -	Sử dụng Firebase Firestore hoặc Realtime Database để lưu trữ dữ liệu và thực hiện các thao tác CRUD.
  - Đảm bảo tích hợp Firebase Storage nếu ứng dụng yêu cầu lưu trữ các tệp phương tiện (ảnh, video).
  - Xử lý các lỗi API từ Firebase (ví dụ: lỗi xác thực, quyền truy cập) và hiển thị thông báo thân thiện.

**- Nếu sử dụng cơ sở dữ liệu quan hệ như MySQL hoặc tương tự**
  - Kết nối với backend sử dụng các API RESTful hoặc GraphQL để giao tiếp với cơ sở dữ liệu.
  - Thực hiện các thao tác CRUD với dữ liệu thông qua các endpoint API.
  - Cấu hình xác thực và phân quyền nếu backend hỗ trợ.
  - Xử lý các lỗi truy vấn (ví dụ: lỗi kết nối, lỗi SQL) và hiển thị thông báo lỗi phù hợp cho người dùng.

**- Nếu sử dụng lưu trữ cục bộ dựa trên file JSON dạng NoSQL như localstore**
  - Sử dụng localstore hoặc thư viện tương tự để lưu trữ dữ liệu cục bộ dưới dạng file JSON trên thiết bị.
  - Đảm bảo ứng dụng có thể thực hiện các thao tác CRUD và đồng bộ dữ liệu khi ứng dụng online.
  - Kiểm tra và xử lý các lỗi lưu trữ (ví dụ: lỗi khi ghi/đọc file) và hiển thị thông báo phù hợp cho người dùng.

### 4. Kiểm thử tự động và CI/CD
- Tạo các bài kiểm thử tự động bao gồm kiểm thử đơn vị (unit test) và kiểm thử giao diện (widget test) để kiểm tra các chức năng cơ bản của ứng dụng.
- Sử dụng GitHub Actions để tự động chạy các kiểm thử khi có thay đổi mã nguồn.

## Công nghệ và Thư viện sử dụng
Sinh viên cần liệt kê một số công nghệ và thư viện cần sử dụng trong quá trình phát triển ứng dụng, ví dụ:
- **Flutter**: Để xây dựng giao diện người dùng.
- **Dio hoặc http**: Để gọi API và xử lý HTTP request.
- **localstore**: Để lưu trữ dữ liệu cục bộ, giúp ứng dụng có thể hoạt động offline.
- **Test Framework (flutter_test)**: Sử dụng để viết các bài kiểm thử tự động.
- **GitHub Actions**: Để tự động hóa quy trình kiểm thử khi có thay đổi mã nguồn.

## Báo cáo kết quả
1. Giới thiệu
Mini Shop là ứng dụng Flutter Web cho phép quản lý sản phẩm với các chức năng:
CRUD sản phẩm (Thêm – Xem – Sửa – Xóa)
Tìm kiếm, lọc theo loại
Tính tổng số lượng và tổng giá trị kho
Lưu trữ dữ liệu cục bộ (Local NoSQL) → dữ liệu vẫn còn khi tắt trình duyệt
Giao diện đơn giản, thân thiện, dễ sử dụng
Có kiểm thử tự động và CI/CD với GitHub Actions

2. Yêu cầu hệ thống
Flutter SDK >= 3.0.0
Dart SDK (đi kèm Flutter)
Trình duyệt Chrome / Edge

3. Tải mã nguồn từ repository.
    ```bash
    git clone <đường dẫn tới repo>
    ```

4. Cài đặt các dependencies:
   ```bash
   flutter pub get
   ```
5. Chạy ứng dụng:
  Build ứng dụng web
    ```bash
    flutter build web
    ```
  Chạy bằng web_server
    ```bash
    flutter run -d web-server --web-port 8080
    ```
  Mở trình duyệt
    (http://localhost:8080)
 
6. Hướng dẫn sử dụng ứng dụng
6.1. Thêm sản phẩm
- Nhấn nút ( + )
- Nhập:
  - Tên sản phẩm
  - Loại sản phẩm
  - Số lượng
  - Giá
  - Ngày nhập hàng
- Nhấn Lưu sản phẩm

6.2. Xem – tìm kiếm – lọc sản phẩm
- Danh sách hiển thị toàn bộ sản phẩm
- Tìm kiếm theo tên sản phẩm
- Lọc theo loại sản phẩm
- Xem:
  - Tổng số lượng kho
  - Tổng giá trị kho

6.3. Sửa sản phẩm
- Nhấn vào sản phẩm trong danh sách
- Cập nhật thông tin
- Nhấn Lưu

6.4. Xóa sản phẩm
- Nhấn biểu tượng 🗑️
- Sản phẩm sẽ bị xóa khỏi kho

7. Kiểm thử tự động 
7.1 Chạy kiểm thử
  ```bash
    flutter test
  ```
### Màn hình chạy flutter test
![Flutter Test](assets/screenshots/flutter_test.png)

7.2 Nội dung kiểm thử
- Kiểm tra hiển thị giao diện chính
- Kiểm tra chức năng thêm / xóa sản phẩm
- Kiểm tra Provider hoạt động đúng

8. CI/CD với GitHub Actions
- Repository đã cấu hình GitHub Actions
- Mỗi lần push hoặc pull request:
  - Tự động cài Flutter
  - Chạy flutter pub get
  - Chạy flutter test
- Kết quả hiển thị trong tab Actions của GitHub



## Yêu cầu nộp bài
- **Source code**: Đẩy toàn bộ mã nguồn lên GitHub repository cá nhân và chia sẻ quyền truy cập.
- **Kiểm thử tự động**: Sinh viên cần viết các bài kiểm thử tự động cho ứng dụng. Các bài kiểm thử cần được tổ chức rõ ràng và dễ hiểu trong thư mục `test` với hậu tố `_test.dart`. Các bài kiểm thử đơn vị (unit test) cần kiểm tra các chức năng cơ bản của ứng dụng và đảm bảo chất lượng mã nguồn. Kiểm thử UI (widget test) cần được viết để kiểm tra giao diện người dùng và các tương tác người dùng cơ bản.
- **Các video demo**: 
  - Quá trình kiểm thử tự động bao gồm kiểm thử đơn vị và kiểm thử UI (bắt buộc).
  - Trình bày các chức năng chính của ứng dụng (bắt buộc).
  Các video cần biên tập sao cho rõ ràng, dễ hiểu và không quá dài (tối đa 5 phút).
- **Báo cáo kết quả**: Đây là nội dung báo cáo của bài tập lớn. Sinh viên cần viết báo cáo ngắn mô tả quá trình phát triển, các thư viện đã sử dụng và các kiểm thử đã thực hiện. Có thể viết trực tiếp trên file README.md này ở mục `Báo cáo kết quả`.
- **GitHub Actions**: Thiết lập GitHub Actions để chạy kiểm thử tự động khi có thay đổi mã nguồn. Tệp cấu hình workflow cần được đặt trong thư mục `.github/workflows`, đặt tên tệp theo định dạng `ci.yml` (có trong mẫu của bài tập lớn). Github Actions cần chạy thành công và không có lỗi nếu mã nguồn không có vấn đề. Trong trường hợp có lỗi, sinh viên cần sửa lỗi và cập nhật mã nguồn để build thành công. Nếu lỗi liên quan đến `Billing & plans`, sinh viên cần thông báo cho giảng viên để được hỗ trợ hoặc bỏ qua yêu cầu này.

## Tiêu chí đánh giá
**5/10 điểm - Build thành công (GitHub Actions báo “Success”)**
- Sinh viên đạt tối thiểu 5 điểm nếu GitHub Actions hoàn thành build và kiểm thử mà không có lỗi nào xảy ra (kết quả báo “Success”).
- Điểm này dành cho những sinh viên đã hoàn thành cấu hình cơ bản và mã nguồn có thể chạy nhưng có thể còn thiếu các tính năng hoặc có các chức năng chưa hoàn thiện.
- Nếu gặp lỗi liên quan đến `Billing & plans` thì phải đảm bảo chay thành công trên máy cá nhân và cung cấp video demo cùng với lệnh `flutter test` chạy thành công.

**6/10 điểm - Thành công với kiểm thử cơ bản (CRUD tối thiểu)**
- Sinh viên đạt 6 điểm nếu build thành công và vượt qua kiểm thử cho các chức năng CRUD cơ bản (tạo, đọc, cập nhật, xóa) cho đối tượng chính.
- Tối thiểu cần thực hiện CRUD với một đối tượng cụ thể (ví dụ: sản phẩm hoặc người dùng), đảm bảo thao tác cơ bản trên dữ liệu.

**7/10 điểm - Kiểm thử CRUD và trạng thái (UI cơ bản, quản lý trạng thái)**
- Sinh viên đạt 7 điểm nếu ứng dụng vượt qua các kiểm thử CRUD và các kiểm thử về quản lý trạng thái.
- Giao diện hiển thị danh sách và chi tiết đối tượng cơ bản, có thể thực hiện các thao tác CRUD mà không cần tải lại ứng dụng.
- Phản hồi người dùng thân thiện (hiển thị kết quả thao tác như thông báo thành công/thất bại).

**8/10 điểm - Kiểm thử CRUD, trạng thái và tích hợp API hoặc/và CSDL**
- Sinh viên đạt 8 điểm nếu ứng dụng vượt qua kiểm thử cho CRUD, trạng thái, và tích hợp API hoặc/và cơ sở dữ liệu (Firebase, MySQL hoặc lưu trữ cục bộ) hoặc tương đương.
- API hoặc cơ sở dữ liệu phải được tích hợp hoàn chỉnh, các thao tác CRUD liên kết trực tiếp với backend hoặc dịch vụ backend.
- Các lỗi từ API hoặc cơ sở dữ liệu được xử lý tốt và có thông báo lỗi cụ thể cho người dùng.

**9/10 điểm - Kiểm thử tự động toàn diện và giao diện hoàn thiện**
- Sinh viên đạt 9 điểm nếu vượt qua các kiểm thử toàn diện bao gồm:
- CRUD đầy đủ
- Quản lý trạng thái
- Tích hợp API/CSDL
- Giao diện người dùng hoàn chỉnh và thân thiện, dễ thao tác, không có lỗi giao diện chính.
- Đảm bảo chức năng xác thực (nếu có), cập nhật thông tin cá nhân, thay đổi mật khẩu (nếu có).

**10/10 điểm - Kiểm thử và tối ưu hóa hoàn chỉnh, UI/UX mượt mà, CI/CD ổn định**
- Sinh viên đạt 10 điểm nếu ứng dụng hoàn thành tất cả kiểm thử tự động một cách hoàn hảo và tối ưu hóa tốt (không có cảnh báo trong kiểm thử và phân tích mã nguồn).
- UI/UX đẹp và mượt mà, có tính nhiều tính năng và tính năng nâng cao (ví dụ: tìm kiếm, sắp xếp, lọc dữ liệu).
- GitHub Actions CI/CD hoàn thiện, bao gồm kiểm thử và các bước phân tích mã nguồn (nếu thêm), đảm bảo mã luôn ổn định.

**Tóm tắt các mức điểm:**
- **5/10**: Build thành công, kiểm thử cơ bản chạy được.
- **6/10**: CRUD cơ bản với một đối tượng.
- **7/10**: CRUD và quản lý trạng thái (hiển thị giao diện cơ bản).
- **8/10**: CRUD, trạng thái, và tích hợp API/CSDL với thông báo lỗi.
- **9/10**: Hoàn thiện kiểm thử CRUD, trạng thái, tích hợp API/CSDL; UI thân thiện.
- **10/10**: Tối ưu hóa hoàn chỉnh, UI/UX mượt mà, CI/CD đầy đủ và ổn định.

## Tự đánh giá điểm: 8/10
Sinh viên cần tự đánh giá mức độ hoàn thiện của ứng dụng và so sánh với tiêu chí đánh giá để xác định điểm cuối cùng. Điểm tự đánh giá sẽ được sử dụng như một tiêu chí tham khảo cho giảng viên đánh giá cuối cùng.

Chúc các bạn hoàn thành tốt bài tập lớn và khám phá thêm nhiều kiến thức bổ ích qua dự án này!

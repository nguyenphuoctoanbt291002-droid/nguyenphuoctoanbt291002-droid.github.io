# Học đi ní — bản sửa lưu và đồng bộ dữ liệu

## Cập nhật GitHub Pages

1. Tải/giải nén gói này.
2. Trước khi đưa `index.html` lên GitHub, mở file và tìm hai dòng:

   ```js
   const SUPABASE_URL='YOUR_SUPABASE_URL';
   const SUPABASE_ANON_KEY='YOUR_SUPABASE_ANON_KEY';
   ```

3. Thay placeholder bằng **hai giá trị thật đang dùng trong `index.html` cũ** của repository:
   - Project URL (`https://....supabase.co`)
   - Publishable key (`sb_publishable_...`)
4. Không đưa `sb_secret_...`, `service_role`, database password hoặc key bí mật vào HTML.
5. Upload file mới đè lên `index.html` trong repository. Không cần chạy lại SQL nếu bảng `public.user_learning_data` và các policy đã được tạo thành công.
6. Chờ GitHub Pages deploy, sau đó mở trang và nhấn Ctrl+Shift+R.

## Những điểm đã sửa

- Lưu bản cache cục bộ ngay khi thay đổi dữ liệu; đánh dấu bản cache đang chờ đồng bộ.
- Đồng bộ Supabase theo hàng đợi, giảm debounce xuống 300 ms.
- Gửi lượt lưu khi tab chuyển sang nền/đóng trang (best effort).
- Khi đăng xuất, chờ đồng bộ xong; nếu lưu thất bại thì không tự đăng xuất.
- Khi đăng nhập lại, nếu máy chủ còn rỗng nhưng thiết bị có cache chưa đồng bộ, khôi phục cache và gửi lại.
- Nếu tài khoản có bản ghi rỗng, có thể tick ô nhập dữ liệu hồ sơ cục bộ để đưa dữ liệu cũ lên cloud.
- Chỉ hiển thị thông báo lưu thành công sau khi Supabase xác nhận upsert thành công.

## Ghi chú quan trọng

- Không xóa dữ liệu trình duyệt (localStorage) trên thiết bị từng có dữ liệu chưa đồng bộ.
- File SQL chỉ cần chạy một lần nếu bảng và policy đã có. Nếu muốn kiểm tra lại, xem `supabase/setup.sql`.
- Nếu dữ liệu đã mất cả trên Supabase lẫn cache cục bộ, bản sửa không thể tự khôi phục dữ liệu không còn ở đâu cả.

# Học đi ní — Học lẹ đi du lịch nè

Website học tiếng Nhật, tiếng Trung và từ vựng chuyên ngành xây dựng/BIM.

## Nội dung

- `index.html`: website chính (GitHub Pages sẽ phục vụ file này).
- `supabase/setup.sql`: tạo bảng dữ liệu cá nhân và chính sách Row Level Security.

## Chạy website trên GitHub Pages

1. Tạo một repository mới trên GitHub, ví dụ `hoc-di-ni`.
2. Giải nén gói này trên máy tính.
3. Trong repository, chọn **Add file → Upload files**.
4. Tải lên `index.html` và thư mục `supabase/` (cùng file `README.md`). Commit thay đổi vào nhánh `main`.
5. Mở **Settings → Pages**.
6. Ở **Build and deployment**, chọn **Deploy from a branch**, branch `main`, folder `/ (root)`, rồi Save.
7. Chờ GitHub Pages hoàn tất và mở URL được hiển thị trong phần Pages.

## Bật tài khoản và đồng bộ tiến độ bằng Supabase

1. Tạo project trong Supabase.
2. Mở **SQL Editor**, chạy toàn bộ nội dung `supabase/setup.sql`.
3. Mở `index.html` bằng VS Code, tìm hai hằng số `SUPABASE_URL` và `SUPABASE_ANON_KEY`.
4. Thay `YOUR_SUPABASE_URL` bằng Project URL và `YOUR_SUPABASE_ANON_KEY` bằng publishable/anon key của project.
5. Commit và push `index.html` đã cập nhật lên GitHub.
6. Trong Supabase → Authentication → URL Configuration, đặt **Site URL** và **Redirect URLs** là URL GitHub Pages của website (ví dụ `https://TEN-GITHUB.github.io/hoc-di-ni/`).

**Bảo mật:** Chỉ đưa Supabase publishable/anon key vào trình duyệt. Tuyệt đối không đưa `service_role` key, mật khẩu, access token hoặc secret vào repository. Bảng dữ liệu bật RLS để mỗi người chỉ truy cập dữ liệu có `user_id` của chính họ.

## Chạy thử cục bộ

Mở `index.html` bằng trình duyệt để xem website. Một số chức năng đăng nhập/đồng bộ cần chạy qua HTTPS sau khi cấu hình Supabase; không nên dùng `file://` cho vận hành tài khoản trực tuyến.

## Cập nhật về sau

Khi chỉnh sửa website, thay nội dung `index.html`, commit thay đổi lên nhánh `main`; GitHub Pages tự triển khai lại sau khi build hoàn tất.

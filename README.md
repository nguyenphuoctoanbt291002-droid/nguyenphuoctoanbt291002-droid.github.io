# Học đi ní — Học lẹ đi du lịch nè

Website học tiếng Nhật, tiếng Trung và từ vựng chuyên ngành xây dựng/BIM.

## Nội dung

- `index.html`: toàn bộ website (HTML/CSS/JavaScript, dữ liệu từ vựng, audio qua trình duyệt/dịch vụ phát âm, tài khoản, ghi chú, tiến độ).
- `supabase/setup.sql`: tạo bảng `public.user_learning_data` và chính sách Row Level Security (RLS).
- `.nojekyll`: hỗ trợ GitHub Pages phục vụ tài nguyên tĩnh.
- `.gitignore`: loại trừ file cục bộ không nên commit.

## 1. Cấu hình Supabase

1. Tạo project Supabase.
2. Mở **SQL Editor → New query**.
3. Mở `supabase/setup.sql`, sao chép toàn bộ và chạy.
4. Trong Supabase, lấy **Project URL** và **Publishable key** (hoặc anon key legacy nếu dự án đang dùng loại đó).
5. Mở `index.html`, tìm hai dòng:

   ```js
   const SUPABASE_URL='YOUR_SUPABASE_URL';
   const SUPABASE_ANON_KEY='YOUR_SUPABASE_ANON_KEY';
   ```

6. Thay phần placeholder bằng Project URL và Publishable key thật của project, giữ nguyên dấu nháy.
7. **Không bao giờ** đưa `sb_secret_...`, `service_role`, mật khẩu database hoặc access token vào HTML/GitHub.

Publishable key được thiết kế để dùng trong client-side app; quyền truy cập dữ liệu phải được giới hạn bằng RLS. SQL đi kèm tạo policy để người dùng đăng nhập chỉ đọc/ghi bản ghi có `user_id = auth.uid()`.

## 2. Đưa lên GitHub Pages

Đưa toàn bộ nội dung trong thư mục này vào thư mục gốc của repository, giữ nguyên cấu trúc:

```text
repository/
├── index.html
├── README.md
├── .gitignore
├── .nojekyll
└── supabase/
    └── setup.sql
```

Sau đó mở **Settings → Pages → Deploy from a branch → main → /(root) → Save**.

## 3. Cấu hình Authentication

Trong Supabase, mở **Authentication → URL Configuration**:

- Site URL: URL GitHub Pages thực tế của website.
- Redirect URLs: thêm đúng URL website (và đường dẫn callback nếu ứng dụng yêu cầu).

## 4. Kiểm tra sau triển khai

1. Mở URL GitHub Pages.
2. Tạo tài khoản test và xác nhận email nếu Supabase yêu cầu.
3. Tạo một ghi chú test và lưu một từ vựng.
4. Kiểm tra Table Editor, bảng `user_learning_data` có bản ghi `user_id` tương ứng.
5. Đăng xuất/đăng nhập lại và kiểm tra dữ liệu còn nguyên.
6. Thử tài khoản thứ hai để xác nhận dữ liệu không bị lẫn.

## Lưu ý quan trọng

- File HTML trong gói này để trống URL/key nhằm tránh phát tán thông tin cấu hình riêng của project. Bạn cần điền lại hai giá trị public của chính mình theo bước 1.
- Nếu dữ liệu cũ chỉ còn trong localStorage của một trình duyệt, hãy đăng nhập trên đúng trình duyệt đó và dùng tùy chọn nhập/chuyển dữ liệu cục bộ (nếu được hỏi) trước khi xóa dữ liệu trình duyệt.
- Gói này không chứa mật khẩu database, Secret key hoặc thông tin đăng nhập của bạn.

## Cập nhật giao diện tài khoản

Khi đăng nhập Supabase (bao gồm tài khoản dùng Gmail/email), khu vực **Hồ sơ riêng trên máy này** sẽ tự ẩn và khung đăng nhập mở rộng toàn chiều ngang. Khi đăng xuất, khu vực hồ sơ cục bộ tự hiện lại.

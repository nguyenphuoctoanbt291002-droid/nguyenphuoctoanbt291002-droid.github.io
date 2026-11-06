# Học đi ní — Học lẹ đi du lịch nè

Website học tiếng Nhật, tiếng Trung và từ vựng chuyên ngành xây dựng/BIM.

## Thành phần

- `index.html`: website chính. Có kho từ vựng Nhật/Trung, Pinyin, Hiragana/Katakana, audio, câu giao tiếp, số đếm, từ vựng xây dựng/thiết kế/thi công/BIM, ôn tập và chương trình bổ trợ Minna no Nihongo 50 bài.
- `supabase/setup.sql`: tạo bảng `public.user_learning_data` và chính sách Row Level Security (RLS) cho dữ liệu học theo từng tài khoản.
- `.nojekyll`: cấu hình GitHub Pages.
- `.gitignore`: bỏ qua file cục bộ không cần đưa lên GitHub.

## Cập nhật cấu hình Supabase trước khi triển khai

Mở `index.html`, tìm đoạn:

```js
const SUPABASE_URL='YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY='YOUR_SUPABASE_ANON_KEY';
const SUPABASE_TABLE='user_learning_data';
```

Thay hai giá trị đầu bằng:

- Project URL của Supabase (dạng `https://<project-ref>.supabase.co`).
- Publishable key (dạng `sb_publishable_...`).

Chỉ dùng Publishable key ở trình duyệt. **Không bao giờ** đưa Secret key, `service_role` key, Database Password, access token hay mật khẩu cá nhân vào `index.html` hoặc GitHub.

## Cơ sở dữ liệu Supabase

Nếu dự án Supabase đã chạy `supabase/setup.sql` và bảng `public.user_learning_data` cùng các policy RLS đang hoạt động, không cần chạy lại.

Nếu là dự án mới:

1. Mở Supabase Dashboard → SQL Editor → New query.
2. Dán toàn bộ nội dung `supabase/setup.sql`.
3. Nhấn Run.
4. Kiểm tra Table Editor có `public.user_learning_data`.

## Đưa lên GitHub Pages

Đặt các file/thư mục ở đúng thư mục gốc của repository:

```text
repository-root/
├── index.html
├── README.md
├── .gitignore
├── .nojekyll
└── supabase/
    └── setup.sql
```

Sau đó:

1. Commit các file lên nhánh `main`.
2. GitHub repository → Settings → Pages.
3. Source: `Deploy from a branch`.
4. Branch: `main`; folder: `/(root)`; nhấn Save.
5. Đợi workflow Pages hoàn tất, mở URL hiển thị tại Settings → Pages.

## Cấu hình Authentication

Trong Supabase Dashboard → Authentication → URL Configuration:

- Site URL: URL GitHub Pages thực tế của website.
- Redirect URLs: thêm URL GitHub Pages thực tế (có thể thêm URL kèm `/**` nếu cần đường dẫn con).

Lưu thay đổi. Nếu bật xác nhận email, người dùng cần xác nhận email trước khi đăng nhập.

## Lưu ý dữ liệu và bảo mật

- Mỗi tài khoản trực tuyến được lưu theo `user_id` trong bảng `user_learning_data`.
- RLS giới hạn người dùng chỉ đọc/ghi bản ghi của chính mình.
- Hồ sơ cục bộ trên trình duyệt khác với tài khoản trực tuyến và không tự đồng bộ thiết bị.
- Khi cập nhật `index.html`, giữ lại đúng Project URL và Publishable key của dự án đang dùng.
- Không chia sẻ ảnh chụp hoặc đoạn mã có chứa mật khẩu hay khóa bí mật.

## Minna no Nihongo

Website có lộ trình ôn tập bổ trợ 50 bài (Quyển I: bài 1–25; Quyển II: bài 26–50). Phần giải thích, ví dụ và câu hỏi là nội dung tự biên soạn để học song song với giáo trình hợp pháp; không phải bản sao sách hay đề thi chính thức. Nhãn N5/N4 chỉ dùng để tham chiếu lộ trình sơ cấp.

-- HỌC ĐI NÍ: bảng lưu tiến độ, ghi chú và từ đã lưu của từng tài khoản
-- Chạy toàn bộ nội dung này trong Supabase Dashboard > SQL Editor.

create table if not exists public.user_learning_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"progress":{"done":[],"known":[],"best":0,"reviews":{},"daily":{"date":"","tasks":[]},"streak":0,"lastStudyDate":""},"notes":[],"bookmarks":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.user_learning_data enable row level security;

-- Mỗi tài khoản chỉ được đọc dữ liệu của chính mình.
drop policy if exists "Users read own learning data" on public.user_learning_data;
create policy "Users read own learning data"
on public.user_learning_data for select to authenticated
using (auth.uid() = user_id);

-- Mỗi tài khoản chỉ được tạo bản ghi mang user_id của chính mình.
drop policy if exists "Users insert own learning data" on public.user_learning_data;
create policy "Users insert own learning data"
on public.user_learning_data for insert to authenticated
with check (auth.uid() = user_id);

-- Mỗi tài khoản chỉ được cập nhật bản ghi của chính mình.
drop policy if exists "Users update own learning data" on public.user_learning_data;
create policy "Users update own learning data"
on public.user_learning_data for update to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- Không bật quyền truy cập cho anon; người học cần đăng nhập.
revoke all on public.user_learning_data from anon;
grant select, insert, update on public.user_learning_data to authenticated;

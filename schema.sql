-- Joseph's Recipe Box — Supabase schema
-- Run this FIRST in the Supabase SQL Editor (Project → SQL Editor → New query)

create table if not exists recipes (
  id text primary key,
  category text not null,
  title text not null,
  subtitle text default '',
  tags jsonb default '[]'::jsonb,
  base_yield numeric,
  yield_unit text default '',
  notes text default '',
  ingredients jsonb default '[]'::jsonb,
  steps jsonb default '[]'::jsonb,
  tips text default '',
  complete boolean default true,
  updated_at timestamptz default now()
);

-- Row Level Security: only signed-in users (you + your partner) can read/write.
-- The anon public key is safe to embed in the app precisely because these
-- policies block anyone who isn't logged in.
alter table recipes enable row level security;

drop policy if exists "authenticated can read recipes" on recipes;
create policy "authenticated can read recipes"
  on recipes for select
  to authenticated
  using (true);

drop policy if exists "authenticated can insert recipes" on recipes;
create policy "authenticated can insert recipes"
  on recipes for insert
  to authenticated
  with check (true);

drop policy if exists "authenticated can update recipes" on recipes;
create policy "authenticated can update recipes"
  on recipes for update
  to authenticated
  using (true);

drop policy if exists "authenticated can delete recipes" on recipes;
create policy "authenticated can delete recipes"
  on recipes for delete
  to authenticated
  using (true);

-- Enable realtime updates so a change on one device shows up on another
alter publication supabase_realtime add table recipes;

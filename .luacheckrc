-- https://luacheck.readthedocs.io/en/stable/warnings.html
-- Luaの標準環境のバージョンを指定
std = "lua51"

-- 許可するグローバル変数を定義
globals = {
}

-- 警告を無視するグローバル変数を指定
read_globals = {
}

-- 特定のエラー/警告を無視する
ignore = {
}

-- 特定のエラーコードを無視
ignore_codes = {
}

-- 複数のエラーを同時に無視する
exclude_files = {
    "tests/.*",    -- テストファイル全般
}

-- 最大警告数を指定
max_errors = 100

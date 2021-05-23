@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem 出力画像ファイル拡張子。
set export_file_extension=.png

rem 出力ディレクトリパス追記。
set export_directory_path=%3%export_file_extension%\

rem 画像変換コマンドの一部省略。
set imd=-define png:

if not %1==return (
	call %~dp0bundle_picture.cmd %~nx0 %*
) else (
	rem 入力画像ファイルをpngに変換して出力します。
	mkdir %export_directory_path% 2>nul
	magick -monitor %imd%compression-level=9 -quality 99 %2 png32:%export_directory_path%%~n2%export_file_extension%
)
endlocal
exit /b
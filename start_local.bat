@echo off
REM ============================================================
REM  RTSGame - one-click LOCAL run (Windows)
REM  Backend serves the API + the built UI + the real "BAR에서 실행".
REM  Requires: Python on PATH, backend\.env with OPENAI_API_KEY,
REM            frontend\dist built (npm run build), and BAR installed.
REM  Open http://localhost:8000 when it starts.
REM ============================================================
cd /d "%~dp0backend"

if not exist "..\frontend\dist\index.html" (
  echo [!] frontend\dist not found. Build it once with:  cd frontend ^&^& npm run build
  echo     ^(API will still run, but the UI page will be missing.^)
)

REM open the browser a few seconds after the server starts
start "" cmd /c "timeout /t 4 >nul & start http://localhost:8000"

echo Starting RTSGame on http://localhost:8000  (close this window to stop)
python -m uvicorn app:app --host 127.0.0.1 --port 8000

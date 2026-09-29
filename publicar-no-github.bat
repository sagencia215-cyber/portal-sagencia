@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo === Enviando o Portal SAgencia para o GitHub ===
echo.
if not exist .git (
  git init -b main
)
git config user.name >nul 2>&1 || git config user.name "sagencia215-cyber"
git config user.email >nul 2>&1 || git config user.email "sagencia215-cyber@users.noreply.github.com"
git add -A
git commit -m "Portal SAgencia: atualizacao"
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/sagencia215-cyber/portal-sagencia.git
git push -u origin main
echo.
if %errorlevel%==0 (
  echo ==========================================
  echo   PRONTO! Codigo enviado para o GitHub.
  echo ==========================================
) else (
  echo ==========================================
  echo   Deu erro. Tire um print desta tela e mande pro Claude.
  echo ==========================================
)
echo.
pause

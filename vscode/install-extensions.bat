echo off

:: VS Code Extensions install script 
:: 
:: Author: Daylin Morgan
:: 
:: DO NOT EDIT MANUALLY!
:: Regenerate with generate_install_scripts.py


echo "Installing VS Code Extensions"
echo.

:: general extensions
:: ------------------
call code --install-extension ms-vscode-remote.remote-ssh --force
call code --install-extension ms-vscode-remote.remote-ssh-edit --force
call code --install-extension ms-vscode-remote.remote-wsl --force
call code --install-extension vscodevim.vim --force

:: misc-tools extensions
:: ---------------------
call code --install-extension Shan.code-settings-sync --force
call code --install-extension janisdd.vscode-edit-csv --force
call code --install-extension cssho.vscode-svgviewer --force
call code --install-extension naumovs.color-highlight --force

:: web-dev extensions
:: ------------------
call code --install-extension bradlc.vscode-tailwindcss --force
call code --install-extension ritwickdey.liveserver --force

:: styling extensions
:: ------------------
call code --install-extension johnpapa.vscode-peacock --force
call code --install-extension PKief.material-icon-theme --force
call code --install-extension Thomaz.preparing --force
call code --install-extension whizkydee.material-palenight-theme --force

:: code-help extensions
:: --------------------
call code --install-extension aaron-bond.better-comments --force
call code --install-extension CoenraadS.bracket-pair-colorizer-2 --force
call code --install-extension streetsidesoftware.code-spell-checker --force
call code --install-extension vsls-contrib.gistfs --force
call code --install-extension mhutchie.git-graph --force
call code --install-extension Github.copilot --force

:: python extensions
:: -----------------
call code --install-extension ms-python.python --force
call code --install-extension ms-toolsai.jupyter --force
call code --install-extension njpwerner.autodocstring --force
call code --install-extension snakemake.snakemake-lang --force

:: language-support extensions
:: ---------------------------
call code --install-extension lextudio.restructuredtext --force
call code --install-extension Ikuyadeu.r --force
call code --install-extension James-Yu.latex-workshop --force
call code --install-extension budparr.language-hugo-vscode --force
call code --install-extension tht13.rst-vscode --force

echo "Extension installation compeleted!"
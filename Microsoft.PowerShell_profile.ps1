# PowerShell Setting
# 2020-06-01 by JKLEE

new-item alias:vim -value gvim
function cdgo   { set-location C:\Dropbox\Source\go-Project }
function cdenv  { set-location C:\Dropbox\ENV }
function cdtool { set-location C:\Dropbox\TOOL }
function vimrc  { gvim C:\Dropbox\ENV\vim\vimrc_win.vim  }
Clear-Host

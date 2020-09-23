# PowerShell Setting
# Create 2020-06-01 by JKLEE

#new-item alias:vim -value gvim
function cdgo   { set-location C:\Dropbox\Source\go-Project }
function cdenv  { set-location C:\Dropbox\ENV }
function cdtool { set-location C:\Dropbox\TOOL }
function cdsrc { set-location C:\Dropbox\Source }
function cdstock { set-location C:\Dropbox\Source\jklee\stock_py }
function vimrc  { gvim C:\Dropbox\ENV\vim\vimrc_win.vim  }
function psrc { gvim   C:\Users\jklee\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 }
function bashrc { gvim   C:\Users\jklee\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 }

Clear-Host


import-module ps-autoenv

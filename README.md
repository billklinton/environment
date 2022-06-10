# Environment Configuration

## First step

Download and install Hack NF font from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf)

## Second step

Download and install [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=pt-br&gl=BR)

## Third step

Download and install [PowerShell 7](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)


## Fourth step

This environment requires pre-release modules and to allow the instalation of pre-release modules in Powershell, you need to run the follow command:

```powershell
Install-Module PowerShellGet -Force
```

After, you need to close the terminal and open again as Administrator.

## Fifth step => Run commands on PowerShell

If you want to change the terminal theme, you can go to [oh-my-posh](https://ohmyposh.dev/docs/themes) and find one you like.
Then, change the theme name on these both lines where the default theme is set.
```
"$env:POSH_THEMES_PATH\default.omp.json"
```

Also you can use a custom theme, for that, on the commands below, change the 
```
"$env:POSH_THEMES_PATH\default.omp.json"
``` 
for 
```
~/oh-my-posh-custom-theme.json
```
In this case I used the User folder to place the theme file.

```powershell
Set-ExecutionPolicy Unrestricted
Install-Module PSReadLine -Force -SkipPublisherCheck -AllowPrerelease
Install-Module posh-git -Force -SkipPublisherCheck -AllowPrerelease
winget install --id JanDeDobbeleer.OhMyPosh
Install-Module -Name Terminal-Icons -Repository PSGallery

Import-Module posh-git
Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\default.omp.json" | Invoke-Expression

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# this will override your current profile, so if you have something custom, do not execute this part, and set the parts you want manually.
$sb = New-Object -TypeName System.Text.StringBuilder
$sb.AppendLine("Import-Module posh-git");
$sb.AppendLine("Import-Module -Name Terminal-Icons");
$sb.AppendLine("oh-my-posh init pwsh --config ""$env:POSH_THEMES_PATH\default.omp.json"" | Invoke-Expression");
$sb.AppendLine("");
$sb.AppendLine("Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete");
$sb.AppendLine("Set-PSReadLineOption -PredictionSource History");
$sb.AppendLine("Set-PSReadLineOption -PredictionViewStyle ListView");
$sb.AppendLine("Set-PSReadLineOption -EditMode Windows");

$sb.ToString() | Out-File -FilePath $profile
```

Then restart your powershell terminal

## Sixth step => Configure the Windows Terminal

Open the Windows Terminal;


Click on the upper arrow, then click settings on the menu;


Click on Add a new profile, then, new empty profile;


Choose a name for your profile;


On command line option, choose the path for the PowerShell 7 exe file, in my case was "C:\Program Files\PowerShell\7\pwsh.exe";


Click in the Appearance option;


On the font type option, select Hack NF font, installed previously;


Then, click on save button;


Back on the left Menu, on startup, select the profile you just criated as your default profile.

## Now you are good to go!!

## Hints

**Powershell shortcuts** =>


You can use some shortcuts on your powershell profile.
Open your powershell profile file, in my case, I opened with Visual Studio Code.
```
code $PROFILE
```
Then, write your function.
For example:
```
function hibernar(){
	shutdown -h
}
```
Save and restart your terminal.


**Git alias** =>


Copy and past this git alias to your .gitconfig file. You can also create your own alias.

```
[alias]
	fetchall = fetch --all --prune
	lognice = log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -10
	st = status
	pr = pull
	co = checkout
	up = pull --rebase --prune
	recommit = commit -a --amend --no-edit    
	ec = config --global -e
	up = !git pull --rebase --prune $@ && git submodule update --init --recursive
	cob = checkout -b
	cm = !git add -A && git commit -m
```
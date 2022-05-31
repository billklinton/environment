function v($qtd){
	while($qtd -gt 0){
		cd ..
		$qtd--
	}
}

function abrir(){
	start ...
}

function hibernar(){
	shutdown -h
}

function repo () {
	cd D:\dev\Repositorios\
}

function fa(){
	git fetchall
}

function GitUp () { & git up }
function GitPush () { & git push origin HEAD -u }
function GitPushForceWithLease () { & git push origin HEAD -u --force-with-lease }

Set-Alias -Name vai -Value GitPush
Set-Alias -Name vai! -Value GitPushForceWithLease
Set-Alias -Name vem -Value GitUp
$env:PreBuildEvent=""
echo "Execute without passing props"
echo "'dotnet build'"
dotnet build
echo "============================="
echo "Hit key to continue"
echo ""
$null = [System.Console]::ReadKey().Key
echo "Execute with requesting target explicitly"
echo "'dotnet build -t:MyAfterBuild'"
dotnet build -t:MyAfterBuild
echo "============================="
echo "Hit key to continue"
echo ""
$null = [System.Console]::ReadKey().Key
echo "Execute with passing global props"
echo "'dotnet build -p:BuildDependsOn=MyAfterBuild'"
dotnet build -p:BuildDependsOn=MyAfterBuild
echo "============================="
echo "Hit key to continue"
echo ""
$null = [System.Console]::ReadKey().Key
echo "Execute with passing global props"
echo "'dotnet build -p:PreBuildEvent=`"msg %username% BUILD HIJACKED! (PreBuildEvent from CLI)`""
dotnet build -p:PreBuildEvent="msg %username% BUILD HIJACKED! (PreBuildEvent from CLI)"
echo "============================="
echo "Hit key to continue"
echo ""
$null = [System.Console]::ReadKey().Key
echo "Execute with prop from env"
echo "`$env:PreBuildEvent=`"msg %username% BUILD HIJACKED! (PreBuildEvent from env)`""
$env:PreBuildEvent="msg %username% BUILD HIJACKED! (PreBuildEvent from env)"
echo "'dotnet build'"
dotnet build
echo "============================="
$env:PreBuildEvent=""
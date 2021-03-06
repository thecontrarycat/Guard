echo ------------------------------ Portable ------------------------------
msbuild Seterlund.CodeGuard.Portable\Seterlund.CodeGuard.Portable.csproj /t:Clean;ReBuild /p:Configuration=Release
copy Seterlund.CodeGuard.Portable\bin\Release\Seterlund.CodeGuard.dll NuGet\lib\portable-net403+sl5+netcore45+wpa81+wp8+MonoAndroid1+MonoTouch1\

echo ------------------------------ .Net 4.0 ------------------------------
msbuild CodeGuard\Seterlund.CodeGuard.csproj /t:Clean;ReBuild /p:Configuration=Release;TargetFrameworkVersion=v4.0
copy CodeGuard\bin\Release\Seterlund.CodeGuard.dll NuGet\lib\net40\

echo ------------------------------ .Net 3.5 ------------------------------
msbuild CodeGuard\Seterlund.CodeGuard.csproj /t:Clean;ReBuild /p:Configuration=Release;TargetFrameworkVersion=v3.5
copy CodeGuard\bin\Release\Seterlund.CodeGuard.dll NuGet\lib\net35\


echo ------------------------------ Build package and upload it ------------------------------


pushd NuGet
..\packages\NuGet.CommandLine.2.8.3\tools\NuGet.exe pack Seterlund.CodeGuard.nuspec
..\packages\NuGet.CommandLine.2.8.3\tools\NuGet.exe push Seterlund.CodeGuard.2.3.4.nupkg
popd


echo ------------------------------Source files ------------------------------
pushd NuGet_Src
powershell -file replace.ps1
..\packages\NuGet.CommandLine.2.8.3\tools\NuGet.exe pack Seterlund.CodeGuard.Source.nuspec
..\packages\NuGet.CommandLine.2.8.3\tools\NuGet.exe push Seterlund.CodeGuard.Source.2.3.4.nupkg
popd

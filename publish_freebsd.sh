#!/bin/sh
RID=freebsd.14-x64
LOADER_DIR=SS14.Loader/bin/Release/net9.0/$RID/publish
LAUNCHER_DIR=SS14.Launcher/bin/Release/net9.0/$RID/publish
DISTNAME=ss14-launcher-$RID
rm -rf $DISTNAME $LOADER_DIR $LAUNCHER_DIR
dotnet publish SS14.Launcher/SS14.Launcher.csproj /p:FullRelease=True -c Release -r $RID --no-self-contained /nologo /p:RobustILLink=true
dotnet publish SS14.Loader/SS14.Loader.csproj -c Release -r $RID --no-self-contained /nologo
cp libHarfBuzzSharp.so $LAUNCHER_DIR
cp libsodium.so $LOADER_DIR
mv $LOADER_DIR $LAUNCHER_DIR/loader
mv $LAUNCHER_DIR $DISTNAME
tar -caf $DISTNAME.zip $DISTNAME

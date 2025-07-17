# ss14-launcher-freebsd
FreeBSD build for the Space Station 14 Launcher

## Dependencies
1. Install `dotnet`:

        # pkg install dotnet

    You may need to set the `DOTNET_ROOT` environment variable.

2. Install `harfbuzz`, e.g.:

        # pkg install harfbuzz

## Pre-Built Binaries
1. You still need to install the above dependencies.

2. Download a pre-built binary for your platform from the "Releases" tab. If a pre-built binary is not available, you will need to build this yourself.

3. Extract the ZIP archive.

4. Run `./SS14.Launcher`

## Building

1. Clone and enter this repository.

2. Copy the following shared libraries into the top level directory:

       - *libHarfBuzzSharp.so*. You can get this from the `harfbuzz` port, e.g.:
       
            $ cp /usr/local/lib/libharfbuzz.so ./libHarfBuzzSharp.so

       - *libsodium.so*. This needs to be from libsodium 1.0.18. A later version from pkg won't work. So you need to do something like:

            $ cd /usr/ports/security/libsodium
            $ git checkout fb16dfecae4a6e -- . # check out the last version of libsodium 1.0.18 from ports
            $ make

         Then grab the resulting shared library.

4. Run the packaging script:

        $ sh publish_freebsd.sh

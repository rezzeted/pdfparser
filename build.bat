@echo off

pushd

if not exist "_intermediate_x64\" (
	mkdir "_intermediate_x64"
)

cd _intermediate_x64

if exist "%ProgramFiles%\Microsoft Visual Studio\2022\" (
	cmake -DCMAKE_TOOLCHAIN_FILE=vcpkg/scripts/buildsystems/vcpkg.cmake .. -G "Visual Studio 17 2022" -A x64
	goto :finish
)

echo Error, neither Visual Studio 2022 or 2019 was found.

:finish
cd ..
popd
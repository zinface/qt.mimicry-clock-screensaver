all:
	mkdir -p build
	cd build && cmake ..
	cd build && make

run: all
	exec $(shell find build/ -maxdepth 1 -type f -executable)

debug: 
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Debug ..
	cd build && make

release:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Release ..
	cd build && make

package: release
	cd build && make package

builddeps:
	mkdir -p build
	cd build && cmake ..
	cd build && make builddeps
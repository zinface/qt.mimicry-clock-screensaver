CPUS=$(shell nproc)
CALENDAR=$(shell date '+%Y%m%d')
OSID=$(shell lsb_release -si)
OSRELEASE=$(shell lsb_release -sr)
SUFFIX=
ifneq ("$(OSID)", "")
SUFFIX=_$(OSID)$(OSRELEASE)
endif

PROJECT_NAME=typhoon-view-screensaver

all:
	mkdir -p build
	cd build && cmake ..
	cd build && make -j$(CPUS)

run: all
	exec $(shell find build/ -maxdepth 1 -type f -executable)

debug: 
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Debug ..
	cd build && make -j$(CPUS)

release:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Release -DPACKAGE_SUFFIX="$(SUFFIX)" ..
	cd build && make -j$(CPUS)

package: release
	cd build && make package
	tree build/_CPack_Packages/Linux/DEB/$(PROJECT_NAME)-*
	dpkg-deb --contents build/$(PROJECT_NAME)_*$(CALENDAR)*$(SUFFIX).deb
	# cd build/_CPack_Packages/Linux/DEB/$(PROJECT_NAME)_*$(CALENDAR)*$(SUFFIX).deb && find .

builddeps:
	cd build && make builddeps

cpus:
	@echo "CPU数量: $(CPUS)"

copytosource:package
	cp build/$(PROJECT_NAME)_*$(CALENDAR)*.deb .

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/atHomeWS18-19/angelina

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/atHomeWS18-19/angelina/build

# Include any dependencies generated for this target.
include example/CMakeFiles/testgui.dir/depend.make

# Include the progress variables for this target.
include example/CMakeFiles/testgui.dir/progress.make

# Include the compile flags for this target's objects.
include example/CMakeFiles/testgui.dir/flags.make

example/CMakeFiles/testgui.dir/testgui.cpp.o: example/CMakeFiles/testgui.dir/flags.make
example/CMakeFiles/testgui.dir/testgui.cpp.o: ../example/testgui.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/atHomeWS18-19/angelina/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/CMakeFiles/testgui.dir/testgui.cpp.o"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/testgui.dir/testgui.cpp.o -c /home/atHomeWS18-19/angelina/example/testgui.cpp

example/CMakeFiles/testgui.dir/testgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testgui.dir/testgui.cpp.i"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/atHomeWS18-19/angelina/example/testgui.cpp > CMakeFiles/testgui.dir/testgui.cpp.i

example/CMakeFiles/testgui.dir/testgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testgui.dir/testgui.cpp.s"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/atHomeWS18-19/angelina/example/testgui.cpp -o CMakeFiles/testgui.dir/testgui.cpp.s

example/CMakeFiles/testgui.dir/testgui.cpp.o.requires:

.PHONY : example/CMakeFiles/testgui.dir/testgui.cpp.o.requires

example/CMakeFiles/testgui.dir/testgui.cpp.o.provides: example/CMakeFiles/testgui.dir/testgui.cpp.o.requires
	$(MAKE) -f example/CMakeFiles/testgui.dir/build.make example/CMakeFiles/testgui.dir/testgui.cpp.o.provides.build
.PHONY : example/CMakeFiles/testgui.dir/testgui.cpp.o.provides

example/CMakeFiles/testgui.dir/testgui.cpp.o.provides.build: example/CMakeFiles/testgui.dir/testgui.cpp.o


example/CMakeFiles/testgui.dir/main.cpp.o: example/CMakeFiles/testgui.dir/flags.make
example/CMakeFiles/testgui.dir/main.cpp.o: ../example/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/atHomeWS18-19/angelina/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object example/CMakeFiles/testgui.dir/main.cpp.o"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/testgui.dir/main.cpp.o -c /home/atHomeWS18-19/angelina/example/main.cpp

example/CMakeFiles/testgui.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testgui.dir/main.cpp.i"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/atHomeWS18-19/angelina/example/main.cpp > CMakeFiles/testgui.dir/main.cpp.i

example/CMakeFiles/testgui.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testgui.dir/main.cpp.s"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/atHomeWS18-19/angelina/example/main.cpp -o CMakeFiles/testgui.dir/main.cpp.s

example/CMakeFiles/testgui.dir/main.cpp.o.requires:

.PHONY : example/CMakeFiles/testgui.dir/main.cpp.o.requires

example/CMakeFiles/testgui.dir/main.cpp.o.provides: example/CMakeFiles/testgui.dir/main.cpp.o.requires
	$(MAKE) -f example/CMakeFiles/testgui.dir/build.make example/CMakeFiles/testgui.dir/main.cpp.o.provides.build
.PHONY : example/CMakeFiles/testgui.dir/main.cpp.o.provides

example/CMakeFiles/testgui.dir/main.cpp.o.provides.build: example/CMakeFiles/testgui.dir/main.cpp.o


example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o: example/CMakeFiles/testgui.dir/flags.make
example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o: example/testgui_automoc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/atHomeWS18-19/angelina/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/testgui.dir/testgui_automoc.cpp.o -c /home/atHomeWS18-19/angelina/build/example/testgui_automoc.cpp

example/CMakeFiles/testgui.dir/testgui_automoc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testgui.dir/testgui_automoc.cpp.i"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/atHomeWS18-19/angelina/build/example/testgui_automoc.cpp > CMakeFiles/testgui.dir/testgui_automoc.cpp.i

example/CMakeFiles/testgui.dir/testgui_automoc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testgui.dir/testgui_automoc.cpp.s"
	cd /home/atHomeWS18-19/angelina/build/example && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/atHomeWS18-19/angelina/build/example/testgui_automoc.cpp -o CMakeFiles/testgui.dir/testgui_automoc.cpp.s

example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.requires:

.PHONY : example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.requires

example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.provides: example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.requires
	$(MAKE) -f example/CMakeFiles/testgui.dir/build.make example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.provides.build
.PHONY : example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.provides

example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.provides.build: example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o


# Object files for target testgui
testgui_OBJECTS = \
"CMakeFiles/testgui.dir/testgui.cpp.o" \
"CMakeFiles/testgui.dir/main.cpp.o" \
"CMakeFiles/testgui.dir/testgui_automoc.cpp.o"

# External object files for target testgui
testgui_EXTERNAL_OBJECTS =

example/testgui: example/CMakeFiles/testgui.dir/testgui.cpp.o
example/testgui: example/CMakeFiles/testgui.dir/main.cpp.o
example/testgui: example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o
example/testgui: example/CMakeFiles/testgui.dir/build.make
example/testgui: /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5.5.1
example/testgui: hermes/libreferee.a
example/testgui: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.5.1
example/testgui: /usr/lib/x86_64-linux-gnu/libQt5Network.so.5.5.1
example/testgui: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.5.1
example/testgui: example/CMakeFiles/testgui.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/atHomeWS18-19/angelina/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable testgui"
	cd /home/atHomeWS18-19/angelina/build/example && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testgui.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/CMakeFiles/testgui.dir/build: example/testgui

.PHONY : example/CMakeFiles/testgui.dir/build

example/CMakeFiles/testgui.dir/requires: example/CMakeFiles/testgui.dir/testgui.cpp.o.requires
example/CMakeFiles/testgui.dir/requires: example/CMakeFiles/testgui.dir/main.cpp.o.requires
example/CMakeFiles/testgui.dir/requires: example/CMakeFiles/testgui.dir/testgui_automoc.cpp.o.requires

.PHONY : example/CMakeFiles/testgui.dir/requires

example/CMakeFiles/testgui.dir/clean:
	cd /home/atHomeWS18-19/angelina/build/example && $(CMAKE_COMMAND) -P CMakeFiles/testgui.dir/cmake_clean.cmake
.PHONY : example/CMakeFiles/testgui.dir/clean

example/CMakeFiles/testgui.dir/depend:
	cd /home/atHomeWS18-19/angelina/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/atHomeWS18-19/angelina /home/atHomeWS18-19/angelina/example /home/atHomeWS18-19/angelina/build /home/atHomeWS18-19/angelina/build/example /home/atHomeWS18-19/angelina/build/example/CMakeFiles/testgui.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/CMakeFiles/testgui.dir/depend


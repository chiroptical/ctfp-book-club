ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

run: safe
> ./safe

safe: safe.cpp
> clang-format -i safe.cpp
> g++ -std=c++17 -o safe safe.cpp

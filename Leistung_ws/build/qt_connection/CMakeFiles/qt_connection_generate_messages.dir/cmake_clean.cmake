file(REMOVE_RECURSE
  "qt_connection_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/qt_connection_generate_messages.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()

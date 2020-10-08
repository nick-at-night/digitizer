add_subdirectory(clock_manager)

add_hdl_file(digitizer.vhdl TOP_FILE
                            LPF_FILE digitizer.lpf
                            DEPENDENCIES clock_manager)

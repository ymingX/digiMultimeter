
# (C) 2001-2023 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 17.0 595 win32 2023.05.02.17:36:18

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     soc_system
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "ncsim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator. In this case, you must also copy the generated files
# # "cds.lib" and "hdl.var" - plus the directory "cds_libs" if generated - 
# # into the location from which you launch the simulator, or incorporate
# # into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# # - If necessary, specify USER_DEFINED_COMPILE_OPTIONS.
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# ncvlog <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME=<simulation top> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If soc_system is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 17.0 595 win32 2023.05.02.17:36:18
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="soc_system"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/intelfpga/17.0/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/altera_common_sv_packages/
mkdir -p ./libraries/fpga_interfaces/
mkdir -p ./libraries/p2b_adapter/
mkdir -p ./libraries/b2p_adapter/
mkdir -p ./libraries/transacto/
mkdir -p ./libraries/p2b/
mkdir -p ./libraries/b2p/
mkdir -p ./libraries/fifo/
mkdir -p ./libraries/timing_adt/
mkdir -p ./libraries/jtag_phy_embedded_in_jtag_master/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/irq_mapper_002/
mkdir -p ./libraries/irq_mapper_001/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_3/
mkdir -p ./libraries/mm_interconnect_2/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/sysid_qsys/
mkdir -p ./libraries/mm_bridge_0/
mkdir -p ./libraries/led_pio/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/hps_0/
mkdir -p ./libraries/f2sdram_only_master/
mkdir -p ./libraries/dipsw_pio/
mkdir -p ./libraries/button_pio/
mkdir -p ./libraries/ILC/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cyclonev_ver/
mkdir -p ./libraries/cyclonev_hssi_ver/
mkdir -p ./libraries/cyclonev_pcie_hip_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/hps_AC_ROM.hex ./
  cp -f $QSYS_SIMDIR/submodules/hps_inst_ROM.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                      -work altera_ver           
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                               -work lpm_ver              
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                  -work sgate_ver            
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                              -work altera_mf_ver        
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                          -work altera_lnsim_ver     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_atoms_ncrypt.v"          -work cyclonev_ver         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                         -work cyclonev_ver         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                    -work cyclonev_hssi_ver    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"                -work cyclonev_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/verbosity_pkg.sv"                                        -work altera_common_sv_packages        -cdslib ./cds_libs/altera_common_sv_packages.cds.lib       
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_utilities_pkg.sv"                                 -work altera_common_sv_packages        -cdslib ./cds_libs/altera_common_sv_packages.cds.lib       
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_pkg.sv"                                        -work altera_common_sv_packages        -cdslib ./cds_libs/altera_common_sv_packages.cds.lib       
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram.v"                                             -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altdq_dqs2_acv_connect_to_hard_phy_cyclonev.sv"          -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_clock_source.sv"                           -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_reset_source.sv"                           -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_mem_if_hhp_qseq_top.v"                            -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/hps_sdram_p0.sv"                                         -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_acv_hard_addr_cmd_pads.v"                   -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_acv_hard_io_pads.v"                         -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_acv_hard_memphy.v"                          -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_acv_ldc.v"                                  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_altdqdqs.v"                                 -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_clock_pair_generator.v"                     -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_generic_ddio.v"                             -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_iss_probe.v"                                -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/hps_sdram_p0_phy_csr.sv"                                 -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_reset.v"                                    -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/hps_sdram_p0_reset_sync.v"                               -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/hps_sdram_pll.sv"                                        -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq.v"                                               -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_addr_router.v"                                   -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_addr_router_001.v"                               -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_addr_router_001_default_decode.v"                -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_addr_router_default_decode.v"                    -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_avalon_dc_fifo.v"                         -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_avalon_mm_bridge.v"                       -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_avalon_mm_clock_crossing_bridge.v"        -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_avalon_sc_fifo.v"                         -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_avalon_st_pipeline_base.v"                -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_hhp_apb2avalon_bridge.v"                  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_mem_if_simple_avalon_mm_bridge.v"         -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_arbitrator.v"                      -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_arb_adder.v"                       -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_burst_uncompressor.v"              -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_master_agent.v"                    -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_master_translator.v"               -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_slave_agent.v"                     -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_slave_translator.v"                -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_altera_merlin_traffic_limiter.v"                 -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_cmd_xbar_demux.v"                                -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_cmd_xbar_demux_001.v"                            -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_cmd_xbar_mux.v"                                  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_hhp_decompress_avl_mm_bridge.v"                  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_id_router.v"                                     -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_id_router_default_decode.v"                      -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_reg_file.v"                                      -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_rsp_xbar_demux.v"                                -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_rsp_xbar_mux.v"                                  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_scc_hhp_phase_decode.v"                          -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_scc_hhp_wrapper.v"                               -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_scc_mgr.v"                                       -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_scc_reg_file.v"                                  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq/seq_trk_mgr.v"                                       -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq_lib/alt_mem_ddrx_buffer.v"                           -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq_lib/alt_mem_ddrx_fifo.v"                             -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/seq_lib/hmctl_synchronizer.v"                            -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_mm_slave_bfm.sv"                           -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/questa_mvc_svapi.svh"                                    -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/mgc_common_axi.sv"                                       -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/mgc_axi_master.sv"                                       -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/mgc_axi_slave.sv"                                        -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_interrupt_sink.sv"                         -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_hps_0_fpga_interfaces_f2h_cold_reset_req.sv"  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_hps_0_fpga_interfaces_f2h_debug_reset_req.sv" -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_hps_0_fpga_interfaces_f2h_warm_reset_req.sv"  -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_hps_0_fpga_interfaces_f2h_stm_hw_events.sv"   -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_hps_0_fpga_interfaces.sv"                     -work fpga_interfaces                  -cdslib ./cds_libs/fpga_interfaces.cds.lib                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_f2sdram_only_master_p2b_adapter.sv"           -work p2b_adapter                      -cdslib ./cds_libs/p2b_adapter.cds.lib                     
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_f2sdram_only_master_b2p_adapter.sv"           -work b2p_adapter                      -cdslib ./cds_libs/b2p_adapter.cds.lib                     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_packets_to_master.v"                       -work transacto                        -cdslib ./cds_libs/transacto.cds.lib                       
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes.v"                     -work p2b                              -cdslib ./cds_libs/p2b.cds.lib                             
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_bytes_to_packets.v"                     -work b2p                              -cdslib ./cds_libs/b2p.cds.lib                             
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                 -work fifo                             -cdslib ./cds_libs/fifo.cds.lib                            
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_f2sdram_only_master_timing_adt.sv"            -work timing_adt                       -cdslib ./cds_libs/timing_adt.cds.lib                      
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_jtag_interface.v"                       -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_jtag_dc_streaming.v"                              -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_jtag_sld_node.v"                                  -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_jtag_streaming.v"                                 -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                        -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                         -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                        -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_remover.v"                         -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_inserter.v"                        -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                      -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                               -work rst_controller                   -cdslib ./cds_libs/rst_controller.cds.lib                  
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                             -work rst_controller                   -cdslib ./cds_libs/rst_controller.cds.lib                  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_irq_mapper_002.sv"                            -work irq_mapper_002                   -cdslib ./cds_libs/irq_mapper_002.cds.lib                  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_irq_mapper_001.sv"                            -work irq_mapper_001                   -cdslib ./cds_libs/irq_mapper_001.cds.lib                  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_irq_mapper.sv"                                -work irq_mapper                       -cdslib ./cds_libs/irq_mapper.cds.lib                      
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_mm_interconnect_3.v"                          -work mm_interconnect_3                -cdslib ./cds_libs/mm_interconnect_3.cds.lib               
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_mm_interconnect_2.v"                          -work mm_interconnect_2                -cdslib ./cds_libs/mm_interconnect_2.cds.lib               
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_mm_interconnect_1.v"                          -work mm_interconnect_1                -cdslib ./cds_libs/mm_interconnect_1.cds.lib               
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_mm_interconnect_0.v"                          -work mm_interconnect_0                -cdslib ./cds_libs/mm_interconnect_0.cds.lib               
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_sysid_qsys.v"                                 -work sysid_qsys                       -cdslib ./cds_libs/sysid_qsys.cds.lib                      
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v"                               -work mm_bridge_0                      -cdslib ./cds_libs/mm_bridge_0.cds.lib                     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_led_pio.v"                                    -work led_pio                          -cdslib ./cds_libs/led_pio.cds.lib                         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_jtag_uart.v"                                  -work jtag_uart                        -cdslib ./cds_libs/jtag_uart.cds.lib                       
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_hps_0.v"                                      -work hps_0                            -cdslib ./cds_libs/hps_0.cds.lib                           
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_f2sdram_only_master.v"                        -work f2sdram_only_master              -cdslib ./cds_libs/f2sdram_only_master.cds.lib             
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_dipsw_pio.v"                                  -work dipsw_pio                        -cdslib ./cds_libs/dipsw_pio.cds.lib                       
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_button_pio.v"                                 -work button_pio                       -cdslib ./cds_libs/button_pio.cds.lib                      
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/interrupt_latency_counter.v"                             -work ILC                              -cdslib ./cds_libs/ILC.cds.lib                             
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/irq_detector.v"                                          -work ILC                              -cdslib ./cds_libs/ILC.cds.lib                             
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/state_machine_counter.v"                                 -work ILC                              -cdslib ./cds_libs/ILC.cds.lib                             
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/soc_system.v"                                                                                                                                                         
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  export GENERIC_PARAM_COMPAT_CHECK=1
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi

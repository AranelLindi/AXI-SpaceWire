----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 03:31:24 PM
-- Design Name: 
-- Module Name: spwwrapper - spwwrapper_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spwwrapper is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        
        -- BRAM_PORTB
        bram_addr_b : out std_logic_vector(31 downto 0);
        bram_clk_b : out std_logic;
        bram_wrdata_b : out std_logic_vector(31 downto 0);
        bram_rdata_b : in std_logic_vector(31 downto 0);
        bram_en_b : out std_logic;
        bram_rst_b : out std_logic;
        bram_we_b : out std_logic_vector(3 downto 0);
        
        -- M_AXI rx
        s_axi_araddr_rx : in std_logic_vector(31 downto 0);
        s_axi_arprot_rx : in std_logic_vector(2 downto 0);
        s_axi_arready_rx : out std_logic;
        s_axi_arvalid_rx : in std_logic;
        s_axi_awaddr_rx : in std_logic_vector(31 downto 0);
        s_axi_awprot_rx : in std_logic_vector(2 downto 0);
        s_axi_awready_rx : out std_logic;
        s_axi_awvalid_rx : in std_logic;
        s_axi_bready_rx : in std_logic;
        s_axi_bresp_rx : out std_logic_vector(1 downto 0);
        s_axi_bvalid_rx : out std_logic;
        s_axi_rdata_rx : out std_logic_vector(31 downto 0);
        s_axi_rready_rx : in std_logic;
        s_axi_rresp_rx : out std_logic_vector(1 downto 0);
        s_axi_rvalid_rx : out std_logic;
        s_axi_wdata_rx : in std_logic_vector(31 downto 0);
        s_axi_wready_rx : out std_logic;
        s_axi_wstrb_rx : in std_logic_vector(3 downto 0);
        s_axi_wvalid_rx : in std_logic;

        -- M_AXI rx
        s_axi_araddr_tx : in std_logic_vector(31 downto 0);
        s_axi_arprot_tx : in std_logic_vector(2 downto 0);
        s_axi_arready_tx : out std_logic;
        s_axi_arvalid_tx : in std_logic;
        s_axi_awaddr_tx : in std_logic_vector(31 downto 0);
        s_axi_awprot_tx : in std_logic_vector(2 downto 0);
        s_axi_awready_tx : out std_logic;
        s_axi_awvalid_tx : in std_logic;
        s_axi_bready_tx : in std_logic;
        s_axi_bresp_tx : out std_logic_vector(1 downto 0);
        s_axi_bvalid_tx : out std_logic;
        s_axi_rdata_tx : out std_logic_vector(31 downto 0);
        s_axi_rready_tx : in std_logic;
        s_axi_rresp_tx : out std_logic_vector(1 downto 0);
        s_axi_rvalid_tx : out std_logic;
        s_axi_wdata_tx : in std_logic_vector(31 downto 0);
        s_axi_wready_tx : out std_logic;
        s_axi_wstrb_tx : in std_logic_vector(3 downto 0);
        s_axi_wvalid_tx : in std_logic;
        
        -- spwstream signals.
        autostart : out std_logic;
        linkstart : out std_logic;
        linkdis : out std_logic;
        txdivcnt : out std_logic_vector(7 downto 0);
        ctrl_in : out std_logic_vector(1 downto 0);
        time_in : out std_logic_vector(5 downto 0);
        txwrite : out std_logic;
        txflag : out std_logic;
        txdata : out std_logic_vector(7 downto 0);
        rxread : out std_logic;
        txrdy : in std_logic;
        txhalff : in std_logic;
        ctrl_out : in std_logic_vector(1 downto 0);
        time_out : in std_logic_vector(5 downto 0);
        rxvalid : in std_logic;
        rxhalff : in std_logic;
        rxflag : in std_logic;
        rxdata : in std_logic_vector(7 downto 0);
        started : in std_logic;
        connecting : in std_logic;
        running : in std_logic;
        errdisc : in std_logic;
        errpar : in std_logic;
        erresc : in std_logic;
        errcred : in std_logic
    );
end spwwrapper;

architecture spwwrapper_arch of spwwrapper is

begin


end spwwrapper_arch;

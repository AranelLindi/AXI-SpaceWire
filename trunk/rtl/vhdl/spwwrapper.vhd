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
        
        -- read from rx_fifo
        -- M_AXI
        m_axi_araddr : out std_logic_vector(31 downto 0);
        m_axi_arprot : out std_logic_vector(2 downto 0);
        m_axi_arready : in std_logic;
        m_axi_arvalid : out std_logic;
        m_axi_awaddr : out std_logic_vector(31 downto 0);
        m_axi_awprot : out std_logic_vector(2 downto 0);
        m_axi_awready : in std_logic;
        m_axi_awvalid : out std_logic;
        m_axi_bready : out std_logic;
        m_axi_bresp : in std_logic_vector(1 downto 0);
        m_axi_bvalid : in std_logic;
        m_axi_rdata : in std_logic_vector(31 downto 0);
        m_axi_rready : out std_logic;
        m_axi_rresp : in std_logic_vector(1 downto 0);
        m_axi_rvalid : in std_logic;
        m_axi_wdata : out std_logic_vector(31 downto 0);
        m_axi_wready : in std_logic;
        m_axi_wstrb : out std_logic_vector(3 downto 0);
        m_axi_wvalid : out std_logic;

        -- write into tx_fifo
        -- S_AXI
        s_axi_araddr : in std_logic_vector(31 downto 0);
        s_axi_arprot : in std_logic_vector(2 downto 0);
        s_axi_arready : out std_logic;
        s_axi_arvalid : in std_logic;
        s_axi_awaddr : in std_logic_vector(31 downto 0);
        s_axi_awprot : in std_logic_vector(2 downto 0);
        s_axi_awready : out std_logic;
        s_axi_awvalid : in std_logic;
        s_axi_bready : in std_logic;
        s_axi_bresp : out std_logic_vector(1 downto 0);
        s_axi_bvalid : out std_logic;
        s_axi_rdata : out std_logic_vector(31 downto 0);
        s_axi_rready : in std_logic;
        s_axi_rresp : out std_logic_vector(1 downto 0);
        s_axi_rvalid : out std_logic;
        s_axi_wdata : in std_logic_vector(31 downto 0);
        s_axi_wready : out std_logic;
        s_axi_wstrb : in std_logic_vector(3 downto 0);
        s_axi_wvalid : in std_logic;
        
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
        errcred : in std_logic;
        
        rx_overflow : in std_logic;
        tx_underflow : in std_logic
    );
end spwwrapper;

architecture spwwrapper_arch of spwwrapper is

begin


end spwwrapper_arch;

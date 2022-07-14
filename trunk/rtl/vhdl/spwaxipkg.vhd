----------------------------------------------------------------------------------
-- Company: University of Wuerzburg
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 07/14/2022 01:51:37 PM
-- Design Name: -/-
-- Module Name: spwaxipkg
-- Project Name: AXI-SpaceWire-Interface
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Package for AXI-SpaceWire-Interface
-- 
-- Dependencies: spwstream (spwpkg)
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

package spwaxipkg is
    -- TODO: AMBA device id may be missing here !
    
    
    -- AXI input signals.
    type s_axi_in_type is record
        -- read address channel
        s_axi_araddr : std_logic_vector(7 downto 0);
        s_axi_arvalid : std_logic;
        
        -- write address channel
        s_axi_awaddr : std_logic_vector(7 downto 0);
        s_axi_awvalid : std_logic;
        
        -- write response channel
        s_axi_bready : std_logic;
        
        -- read data channel
        s_axi_rready : std_logic;
        
        -- write data channel
        s_axi_wdata : std_logic_vector(31 downto 0);
        s_axi_wstb : std_logic_vector(3 downto 0);
        s_axi_wvalid : std_logic;
    end record;
    
    -- AXI output signals.
    type s_axi_out_type is record
        -- read address channel.
        s_axi_aready : std_logic;
        
        -- write address channel.
        s_axi_awready : std_logic;
        
        -- write response channel.
        s_axi_bresp : std_logic_vector(1 downto 0);
        s_axi_bvalid : std_logic;
        
        -- read data channel.
        s_axi_rdata : std_logic_vector(31 downto 0);
        s_axi_rresp : std_logic_vector(1 downto 0);
        s_axi_rvalid : std_logic;
        
        -- write data channel.
        s_axi_wready : std_logic;
    end record;   
    
    -- Signals from SpaceWire core to AXI Master.
--    type spw_axi_in_type is record
        
--    end record;
    
--    -- Signals from AXI Master to SpaceWire core.
--    type spw_axi_out_type is record
        
--    end record;
end package;
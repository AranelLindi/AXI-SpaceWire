----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 02:51:19 PM
-- Design Name: 
-- Module Name: spwstream_top - spwstream_top_arch
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

use work.spwpkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spwstream_top is
    Port (
        -- 100 MHz System clock.
        clk100:        in  std_logic;

        -- Receiver sample clock (only for impl_fast)
        rxclk:      in  std_logic;

        -- Transmit clock (only for impl_fast)
        txclk:      in  std_logic;

        -- Synchronous reset (active-high).
        rst:        in  std_logic;

        -- Enables automatic link start on receipt of a NULL character.
        autostart:  in  std_logic;

        -- Enables link start once the Ready state is reached.
        -- Without autostart or linkstart, the link remains in state Ready.
        linkstart:  in  std_logic;

        -- Do not start link (overrides linkstart and autostart) and/or
        -- disconnect a running link.
        linkdis:    in  std_logic;

        -- Scaling factor minus 1, used to scale the transmit base clock into
        -- the transmission bit rate. The system clock (for impl_generic) or
        -- the txclk (for impl_fast) is divided by (unsigned(txdivcnt) + 1).
        -- Changing this signal will immediately change the transmission rate.
        -- During link setup, the transmission rate is always 10 Mbit/s.
        txdivcnt:   in  std_logic_vector(7 downto 0);

        -- High for one clock cycle to request transmission of a TimeCode.
        -- The request is registered inside the entity until it can be processed.
        tick_in:    in  std_logic;

        -- Control bits of the TimeCode to be sent. Must be valid while tick_in is high.
        ctrl_in:    in  std_logic_vector(1 downto 0);

        -- Counter value of the TimeCode to be sent. Must be valid while tick_in is high.
        time_in:    in  std_logic_vector(5 downto 0);

        -- Pulled high by the application to write an N-Char to the transmit
        -- queue. If "txwrite" and "txrdy" are both high on the rising edge
        -- of "clk", a character is added to the transmit queue.
        -- This signal has no effect if "txrdy" is low.
        txwrite:    in  std_logic;

        -- Control flag to be sent with the next N_Char.
        -- Must be valid while txwrite is high.
        txflag:     in  std_logic;

        -- Byte to be sent, or "00000000" for EOP or "00000001" for EEP.
        -- Must be valid while txwrite is high.
        txdata:     in  std_logic_vector(7 downto 0);

        -- High if the entity is ready to accept an N-Char for transmission.
        txrdy:      out std_logic;

        -- High if the transmission queue is at least half full.
        txhalff:    out std_logic;

        -- High for one clock cycle if a TimeCode was just received.
        tick_out:   out std_logic;

        -- Control bits of the last received TimeCode.
        ctrl_out:   out std_logic_vector(1 downto 0);

        -- Counter value of the last received TimeCode.
        time_out:   out std_logic_vector(5 downto 0);

        -- High if "rxflag" and "rxdata" contain valid data.
        -- This signal is high unless the receive FIFO is empty.
        rxvalid:    out std_logic;

        -- High if the receive FIFO is at least half full.
        rxhalff:    out std_logic;

        -- High if the received character is EOP or EEP; low if the received
        -- character is a data byte. Valid if "rxvalid" is high.
        rxflag:     out std_logic;

        -- Received byte, or "00000000" for EOP or "00000001" for EEP.
        -- Valid if "rxvalid" is high.
        rxdata:     out std_logic_vector(7 downto 0);

        -- Pulled high by the application to accept a received character.
        -- If "rxvalid" and "rxread" are both high on the rising edge of "clk",
        -- a character is removed from the receive FIFO and "rxvalid", "rxflag"
        -- and "rxdata" are updated.
        -- This signal has no effect if "rxvalid" is low.
        rxread:     in  std_logic;

        -- High if the link state machine is currently in the Started state.
        started:    out std_logic;

        -- High if the link state machine is currently in the Connecting state.
        connecting: out std_logic;

        -- High if the link state machine is currently in the Run state, indicating
        -- that the link is fully operational. If none of started, connecting or running
        -- is high, the link is in an initial state and the transmitter is not yet enabled.
        running:    out std_logic;

        -- Disconnect detected in state Run. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errdisc:    out std_logic;

        -- Parity error detected in state Run. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errpar:     out std_logic;

        -- Invalid escape sequence detected in state Run. Triggers a reset and reconnect of
        -- the link. This indication is auto-clearing.
        erresc:     out std_logic;

        -- Credit error detected. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errcred:    out std_logic;

        -- Data In signal from SpaceWire bus.
        spw_di:     in  std_logic;

        -- Strobe In signal from SpaceWire bus.
        spw_si:     in  std_logic;

        -- Data Out signal to SpaceWire bus.
        spw_do:     out std_logic;

        -- Strobe Out signal to SpaceWire bus.
        spw_so:     out std_logic
    );
end spwstream_top;

architecture spwstream_top_arch of spwstream_top is

begin
    SpaceWirePort : spwstream
        generic map (
            sysfreq => 100.0e6,
            txclkfreq => 100.0e6,
            rximpl => impl_fast,
            rxchunk => 1,
            tximpl => impl_fast,
            rxfifosize_bits => 11,
            txfifosize_bits => 11
        )
        port map (
            clk => clk100,
            rxclk => clk100,
            txclk => clk100,
            rst => rst,
            autostart => autostart,
            linkstart => linkstart,
            linkdis => linkdis,
            txdivcnt => txdivcnt,
            tick_in => tick_in,
            ctrl_in => ctrl_in,
            time_in => time_in,
            txwrite => txwrite,
            txflag => txflag,
            txdata => txdata,
            txrdy => txrdy,
            txhalff => txhalff,
            tick_out => tick_out,
            ctrl_out => ctrl_out,
            time_out => time_out,
            rxvalid => rxvalid,
            rxhalff => rxhalff,
            rxflag => rxflag,
            rxdata => rxdata,
            rxread => rxread,
            started => started,
            connecting => connecting,
            running => running,
            errdisc => errdisc,
            errpar => errpar,
            erresc => erresc,
            errcred => errcred,
            spw_di => spw_di,
            spw_si => spw_si,
            spw_do => spw_do,
            spw_so => spw_so
        );    

end spwstream_top_arch;

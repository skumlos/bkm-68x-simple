BKM-68X alternative input board

This project aims to serve as an alternative to the crazy expensive Sony BKM-68X RGB/YPbPr
input card for Sony BVM-A monitors like the BVM-A14F5, A20F1, A24E1W and A32E1W (M/U/A).

The board is rather simple albeit has some components that are not so simple to hand solder,
and it also has a quite high component count (due to a load of resistors and caps).

It's buildup is basically an analog section that deals with video, and a digital section
that speaks to the monitor.

The analog section buffers the video by an THS7374 (with the LPF disabled!) and throws
those through an ADG1611 (or compatible) switch, working via the VIDEO_OE_X signal from
the FPGA. The Y/G signal is first routed through an ISL4089 which strips the sync part 
(if needed) from the signal to avoid too bright picture in YPbPr and SoG signals. This
is however only done if the input is YPbPr at 480p and below and for RGsB signals.
In version 1.1 of the software, this can be switched by turning aperture on. This might
be removed later though, as this is somewhat for testing.

The sync signal is separated through an ISL59885 with a color filter in front (as per
the datasheet), and the signal to be separated (external or Y signal) is chosen via
INT_EXT_X signal to an ADG734 switch.

These are then passed to the FPGA which detects sync polarity and changes accordingly
to positive sync, and then sends the two signals into the monitor.

The digital section consists of a FPGA (Intel MAX 10 in an EQFP-144 package as of this
writing) with a buttload of schmitt triggers and line drivers, all replicated from the
original 68X service manual. The card thus tries to be electrically similar to the
original, at the interface level.

The FPGA is expected to be programmed with the HDL from https://github.com/skumlos/bkm-68x-fpga

75 Ohm termination can be selected by the switches, which either terminates, or passthroughs
(in that case external terminators are needed, unless signal is actually passed through to a
terminating monitor).

The card has no aperture circuit so it can only pass the signal straight through to the monitor
as it originally is (buffered and level conditioned).

Compared to the original BKM-68X, this has severely better sync handling seemingly.

The list of tested consoles that syncs fine as of revision E1 is:

SNES (2CHIP US) 60Hz (CSYNC)

SNES (1CHIP FAT US) 60Hz (CSYNC)

SNES (2CHIP EU) 50Hz (Sync on luma)

SNES (1CHIP EU, SNSP-1CHIP-01) 50Hz (Sync on luma)

Genesis (US) 60Hz (CVBS sync)

Genesis 2 (US) 60Hz (CSYNC)

Mega Drive (EU) 50Hz (CVBS sync)

Mega Drive 2 (EU, DFO) 60Hz (CSYNC)

Mega Drive 2 (EU, DFO) 50Hz (CSYNC)

Master System (on Genesis through Power Base) 60Hz (CVBS sync)

Master System (EU, DFO) 60Hz (CSYNC)

Master System (EU, DFO) 50Hz (CSYNC)

Master System (EU, VA3, no DFO) 60Hz (59,38Hz) (CSYNC)

Master System (EU, VA3, no DFO) 50Hz (CSYNC)

Nintendo 64 (NUSJ) 60Hz (THS7314 RGB) (CSYNC)

Wii (EU) 576i 50Hz (YPbPr)

Wii (EU) 480i 60Hz (YPbPr)

Wii (EU) 480p 60Hz (YPbPr)

PSone SCPH-101 (EU) (MM3+MFO) 60Hz (RGC CSYNC)

PSone SCPH-101 (EU) (MM3+MFO) 50Hz (RGC CSYNC)

PS2 (US) 240p/480i 60Hz (RGBS)

PS2 (US) 480p 60Hz (RGsB)

PS2 (US) 240p/480i/480p (YPbPr)

PS3 (EU) 576i 50Hz (YPbPr)

PS3 (EU) 576p 50Hz (YPbPr)

PS3 (EU) 720p 60Hz (YPbPr)

PS3 (EU) 1080i 60Hz (YPbPr)

PC Engine (White), External RGB mod (THS7374, Genesis 2 plug), 60Hz (CSYNC)

Analogue Nt Mini 2.0 60Hz RGBS (so CSYNC)

Amiga 500 RGBS (PAL) 50Hz (CSYNC)

Xbox 360 (EU) 480i/480p/720p 50/60Hz (YPbPr)

Xbox 360 (EU) 1080i 60Hz (YPbPr) (1080i 50Hz seems to just flicker. Does the same with original 68X)

A load of MiSTer cores which are normally deemed problematic, including DoDonPachi
whose whack VSYNC of 57.6 Hz makes the original BKM-68X scroll the picture with a
steady OSD, while this version has a steady picture with a rolling OSD :)

Master System with CVBS sync works, but sometimes "glitches". This is apparently
due to the quite noisy CVBS signal, which the sync separator picks up. Without
the color filter it is unusable.

It is generally recommended to use CSYNC signals at 75 Ohm levels.

Revision history:

E1: Add "proper" 5V->3.3V translation for sync lines

E: Add "Y/G normalization" control from FPGA

D1: Add STBY_5V pinheader for easier outside-monitor-programming of FPGA.

D: Add DC restore and sync-removal circuit on Y/G line

C1: Minor layout changes

C: Added mounting screw brackets and shortened board for a PCB front, change switch to LFCSP version

B: Added onboard FPGA, color filter, rerouted signals.

A: Initial version

More information @ https://www.immerhax.com

Credits:
Mathias Hyldgaard for providing me with a BVM-A20, which initiated the whole project!
Bob from RetroRGB for testing and listening to my woes :)
The secret benefactor(s) of the original BKM-68X which made the whole project much easier, and ultimately made it possible!
Steve Nutter for being a helpful guy within the pro monitor scene!
The people on the CRT discord and Professional and Broadcast Monitor Facebook group!

(2021) Martin Hejnfelt, martin@hejnfelt.com

This work is released under the CERN Open Hardware Licence version 2 (CERN-OHL-W), see LICENCE.TXT

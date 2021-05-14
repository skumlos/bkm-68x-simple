BKM-68X alternative input board

This project aims to serve as an alternative to the crazy expensive Sony BKM-68X RGB/YPbPr input card for Sony BVM-A monitors like the BVM-A14F5, A20F1, A24E1W and A32E1W (M/U/A).

The board is rather simple albeit has some components that are not so simple to hand solder, and it also has a quite high component count (due to a load of resistors and caps).

It's buildup is basically an analog section that deals with video, and a digital section that speaks to the monitor.
The analog section buffers the video by an THS7374 (with the LPF disabled!) and throws those through an ADG1611 (or compatible) switch, working via the VIDEO_OE_X signal from the FPGA.
The sync signal is separated through an ISL59885 with a color filter in front (as per the datasheet), and the signal to be separated (external or Y signal) is chosen via INT_EXT_X signal to an ADG734 switch.
These are then passed to the FPGA which inverts to positive sync (thus card expects negative sync right now), which then sends the two signals into the monitor.

The digital section consists of a FPGA (Intel MAX 10 in an EQFP-144 package as of this writing) with a buttload of schmitt triggers and line drivers, all replicated from the original 68X service manual.
The card thus tries to be electrically similar to the original, at the interface level.

The FPGA is expected to be programmed with the HDL from https://github.com/skumlos/bkm-68x-fpga (unless something better appears).

75 Ohm termination can be selected by the switches, which either terminates, or passthroughs (in that case external terminators are needed, unless signal is actually passed through to a terminating monitor).

The card has no aperture circuit so it can only pass the signal straight through to the monitor as it originally is.

Compared to the original BKM-68X, this has severely better sync handling seemingly.
The list of tested consoles that syncs fine as of revision B. is:

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

PSone SCPH-101 (EU) (MM3+MFO) 60Hz (RGC CSYNC)

PSone SCPH-101 (EU) (MM3+MFO) 50Hz (RGC CSYNC)

Wii (EU) 576i 50Hz (YPbPr)

Wii (EU) 480i 60Hz (YPbPr)

Wii (EU) 480p 60Hz (YPbPr)

PS3 (EU) 576i 50Hz (YPbPr)

PS3 (EU) 576p 50Hz (YPbPr)

PS3 (EU) 720p 60Hz (YPbPr)

PS3 (EU) 1080i 60Hz (YPbPr)

PC Engine (White), External RGB mod (THS7374, Genesis 2 plug), 60Hz (CSYNC)

Analogue Nt Mini 2.0 60Hz RGBS (so CSYNC)

Master System with CVBS sync works, but sometimes "glitches". This is apparently due to the quite noisy CVBS signal, which the sync separator picks up. Without the color filter it is unusable.

It is generally recommended to use CSYNC signals.

Revision history:

B: Added onboard FPGA, color filter, rerouted signals.

A: Initial unreleased version

More information @ https://www.immerhax.com

(2021) Martin Hejnfelt, martin@hejnfelt.com

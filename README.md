# 🧠 Writing a 32-bit x86 Bootloader 

building a minimal 32-bit x86 OS bootloader that prints `Hello world!` to the screen. In this first part, we write a simple bootloader in **assembly**, load it with **BIOS**, and emulate it using **QEMU**.

We start from scratch and build up to write kernel-level code in C/C++. This project serves as a hands-on introduction to low-level systems programming.

---

## 🛠️ Prerequisites

Before we begin, ensure, have the following tools installed:

### ✅ On Ubuntu / WSL:
```bash
sudo apt-get update
sudo apt-get install nasm qemu
```

### On MacOS
```bash
brew install nasm qemu
```

### On Windows 
Use Windows Subsystem for Linux (WSL) and follow Ubuntu steps above.
Install an X Server (e.g., Xming or VcXsrv) to allow QEMU to open windows from WSL.

## What Happened During BOOT?

When the computer starts, the BIOS performs hardware checks.

It then loads the first 512 bytes from the bootable media (e.g., floppy disk) into memory at address 0x7C00.

If the last 2 bytes of the sector are 0xAA55, the BIOS jumps to that memory location.

At this point, the CPU is in 16-bit Real Mode and begins executing the bootloader code

### Build And Run 
## Assemble the Bootloader 
```bash
nasm -f bin boot1.asm -o boot1.bin
```

## Inspect the Binary
```bash
  hexdump -C boot1.bin
```

You should see Hello world! in ASCII, padded with zeros, and ending with 55 aa

## Run in QEMU
```bash
qemu-system-x86_64 -fda boot1.bin
```

If you're using WSL, run export DISPLAY=:0 before executing QEMU.

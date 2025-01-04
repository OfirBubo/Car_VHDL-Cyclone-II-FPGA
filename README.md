# Car 🚗 - Cyclone-II-FPGA (VHDL code)

This repository contains the VHDL code for a car simulation project. Each file represents a specific module or component of the system. Below is a detailed description of each file and its purpose.

## Files and Descriptions

### 1. `car_Integration.vhd`

**Purpose:**
This file integrates all components of the car system, including inputs, track control, wheels, lights, sounds, and fan motor. It serves as the main test bench for the system.

**Key Features:**

- **Inputs:**
  - `resetN`, `A`, `B`, `clk`: Basic control signals.
  - `C`: Fan speed control (3 bits).
  - `T_i`: Track type input (2 bits).
- **Outputs:**
  - Wheels: `FR`, `BR`, `FL`, `BL` for forward, reverse, and stop control.
  - Lights: `green_leds`, `red_leds`.
  - Sound: `sound1`, `sound2`, `sound3`.
  - Fan: `fan` control signal.

**Components:**

- `input`: Processes basic inputs and generates control signals.
- `track`: Handles track movement and processing.
- `wheels`: Manages wheel directions and movements.
- `lights`: Controls red and green LEDs based on movement type.
- `sounds`: Generates sound signals.
- `fan_motor`: Controls the fan speed using PWM signals.

### 2. `clk_divider.vhd`

**Purpose:**
Generates a divided clock signal from the main clock input.

**Key Features:**

- Input: `clk`, `rst`.
- Output: `clk_divided`.
- Divides the clock by a constant value (`DIV_BY = 2500000`).
- Ensures a 50% duty cycle for the divided clock.

### 3. `input.vhd`

**Purpose:**
Processes the system inputs and generates initial control signals for other components.

**Key Features:**

- Inputs: `resetN`, `A`, `B`, `clk`, `C`, `T_i`.
- Outputs: Control signals such as `a0`, `b0`, `c0`, `t_o_i`, `rst_o`, and `clk_divided`.
- Uses the `clk_divider` component to generate a slower clock signal.

### 4. `lights.vhd`

**Purpose:**
Controls the red and green LEDs based on the movement type.

**Key Features:**

- Inputs: `clk`, `rst`, `RL` (movement type).
- Outputs: `red`, `green` LED patterns.
- Implements LED animations based on input movement type (`RL`).

### 5. `track.vhd`

**Purpose:**
Handles track-related functionality and processes signals based on the type of track selected.

**Key Features:**

- Inputs: `resetN`, `A`, `B`, `clk`, `T` (track type).
- Outputs: `a0`, `b0`, `t_o`, `clk_divided`, `rst_o`.
- Internal logic to manage track-specific signal processing.

### 6. `sounds.vhd`

**Purpose:**
Generates sound signals corresponding to different movement patterns (circle, square, etc.).

**Key Features:**

- **Inputs:**
  - `clk`, `rst`: Basic control signals.
  - `RL`: Movement type input (2 bits).
- **Outputs:**
  - `sound1`, `sound2`, `sound3`: Sound signals ranging from -128 to 127.

**Implementation Details:**

- Internal memory stores pre-defined sine wave values (`sine`, `sine1`, `sine2`) for sound generation.
- Sound signals are output based on the movement type (`RL`).
- Includes reset behavior to initialize outputs to default values.

### 7. `wheals.vhd`

**Purpose:**
Controls the movement and direction of the car's wheels based on input commands.

**Key Features:**

- **Inputs:**
  - `Directions`: 2-bit signal specifying direction (`00` for forward, `11` for reverse, `01` for left, `10` for right).
  - `clk`, `rst`: Basic control signals.
- **Outputs:**
  - `FR`, `BR`, `FL`, `BL`: Wheel control signals (`00`/`11` for stop, `01` for forward, `10` for reverse).

**Implementation Details:**

- Uses a process block triggered by `clk` and `rst`.
- Outputs wheel control signals (`FR`, `BR`, `FL`, `BL`) based on the direction input (`Directions`).
- Includes reset behavior to stop all wheels by setting outputs to `00`.

## Getting Started

### Prerequisites

- VHDL Simulator ModelSim

### Usage

1. Compile all VHDL files in your simulator.
2. Use `car_Integration.vhd` as the top-level file.
3. Simulate the design to verify functionality.

### Notes

- Ensure the clock frequency matches the requirements of `clk_divider.vhd`.
- Adjust constants or parameters as needed to suit your simulation environment.

## Author
- Ofir

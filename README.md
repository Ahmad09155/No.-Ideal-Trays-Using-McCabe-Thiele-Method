# McCabe-Thiele Method for Binary Distillation

This repository contains a set of MATLAB scripts for performing calculations related to binary distillation columns using the McCabe-Thiele graphical method. The McCabe-Thiele method is a simplified method for calculating the number of theoretical stages required for a given separation in a binary distillation column.

## Features

* **`mccabe_thiele.m`**:
    * Calculates the number of ideal trays required for a binary distillation column using the McCabe-Thiele method when the relative volatility (alpha) is known.
    * Plots the equilibrium curve, operating lines (rectifying, stripping, and feed lines), and steps off the ideal stages.
    * Determines the intersection point of the operating lines and the feed line.
    * Calls functions to calculate the minimum number of trays and minimum reflux ratio.
* **`mccabe_xy_input.m`**:
    * Similar to `mccabe_thiele.m`, but designed for cases where experimental x-y equilibrium data (liquid and vapor mole fractions) is provided instead of relative volatility.
    * Plots the equilibrium curve from the given x-y data, operating lines, and steps off the ideal stages.
    * Calls a function to calculate the minimum number of trays based on the provided x-y data.
* **`min_reflux.m`**:
    * A function to calculate the minimum reflux ratio (Rmin) for a binary distillation column, given the relative volatility (alpha), feed mole fraction (zF), and distillate mole fraction (xD).
* **`minimum_trays.m`**:
    * A function to calculate the minimum number of theoretical trays (Nmin) at total reflux for a binary distillation column, using the relative volatility (alpha), distillate mole fraction (xD), and bottom mole fraction (xB).
    * Graphically steps off the minimum trays on an x-y diagram.
* **`minimum_trays_xy.m`**:
    * A function to calculate the minimum number of theoretical trays (Nmin) at total reflux when x-y equilibrium data is provided.
    * Graphically steps off the minimum trays using the provided x-y data.

### Getting Started

### Prerequisites

* MATLAB or GNU Octave

## Author

Ahmad M. Hassan Chemical Engineering Student | Sudan
Chemical engineering student interested in process simulation and engineering problem-solving through MATLAB and Python coding.
GitHub: Ahmad09155



---

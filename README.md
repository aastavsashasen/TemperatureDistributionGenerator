# Temperature Distribution Generator (MATLAB)

Contains 2 pieces of code that allow for the generation of a temperature distribution obtained by testing (with Buller Rings, Thermocouples, etc...). The first script creates a distribution for a 3X3X3 (=27) point test.
The second script creates a distribution for an arbitary point test that may have missing data points (this is approximated by interpolation/ extrapolation).

## Images



### Set-Up

Apart from MATLAB, you will also requires INPAINTN (3rd party interpolation/ extrapolation for meshgrids). The code is thanks to Damien Garcia and you can find it here:
https://www.mathworks.com/matlabcentral/fileexchange/27994-inpaint-over-missing-data-in-1-d-2-d-3-d-nd-arrays?focused=8189785&tab=function

To setup for script 1 change the temperature values of each node to what is returned by your testing results. Also note the max/min temperature values in the variable "max" and "min". Note that manually narrowing this range will allow you to focus on a finer range of your data.

```
example 1
```

To setup for script 2 change the temperature values of each node to what is returned by your testing results. You can leave nodes without values as "Nan". This script is an example and you may have to alter the main meshgrid to suite your test. Also note the max/min temperature values in the variable "max" and "min". Note that manually narrowing this range will allow you to focus on a finer range of your data.

```
until finished
```


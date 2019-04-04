# Temperature Distribution Generator (MATLAB)

Contains 2 pieces of code that allow for the generation of a temperature distribution obtained by testing (with Buller Rings, Thermocouples, etc...). The first script creates a distribution for a 3X3X3 (=27) point test.
The second script creates a distribution for an arbitary point test that may have missing data points (this is approximated by interpolation/ extrapolation).

## Images

Results of Script 1 = "SENTempDistGen1"
![script1_4](https://user-images.githubusercontent.com/37192765/55550397-b2a5a380-570a-11e9-9294-0bfea5fe15a2.jpg)
![script1_3](https://user-images.githubusercontent.com/37192765/55549486-90128b00-5708-11e9-8344-e3bf2127c617.jpg)
![script1_2](https://user-images.githubusercontent.com/37192765/55549493-93a61200-5708-11e9-9d12-a24897678ced.jpg)
![script1_1](https://user-images.githubusercontent.com/37192765/55549496-96086c00-5708-11e9-8013-31032049d3c1.jpg)

Results of Script 2 = "SENTempDistGen2"
![script2_4](https://user-images.githubusercontent.com/37192765/55550595-2a73ce00-570b-11e9-987b-77dc948d99eb.jpg)
![script2_3](https://user-images.githubusercontent.com/37192765/55550602-2cd62800-570b-11e9-9087-89d01e12b7db.jpg)
![script2_2](https://user-images.githubusercontent.com/37192765/55550604-2e9feb80-570b-11e9-9e13-8af67bf15ae4.jpg)
![script2_1](https://user-images.githubusercontent.com/37192765/55550609-319adc00-570b-11e9-9dc8-5edb70729e2b.jpg)

### Set-Up

Apart from MATLAB, you will also requires INPAINTN (3rd party interpolation/ extrapolation for meshgrids). The code is thanks to Damien Garcia and you can find it here:
https://www.mathworks.com/matlabcentral/fileexchange/27994-inpaint-over-missing-data-in-1-d-2-d-3-d-nd-arrays?focused=8189785&tab=function

To setup for script 1 change the temperature values of each node to what is returned by your testing results. Also note the max/min temperature values in the variable "max" and "min". Note that manually narrowing this range will allow you to focus on a finer range of your data.

To setup for script 2 change the temperature values of each node to what is returned by your testing results. You can leave nodes without values as "Nan". This script is an example and you may have to alter the main meshgrid to suite your test. Also note the max/min temperature values in the variable "max" and "min". Note that manually narrowing this range will allow you to focus on a finer range of your data.

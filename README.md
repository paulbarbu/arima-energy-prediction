Predicting energy usage with the ARIMA algorithm
================================================

Dependencies
============
https://github.com/Workday/timeseries-forecast

Note: this library is mirrored in this repository (including its license) just for building purposes,
the code for that library is not mine.
The code belongs to its rightful owner.

Installation & usage
====================

Download `timeseries-forecast` from the above URL (or use the version provided in this repo) and run `mvn install` on it.

Then run the following in the `energyarima` directory:

```
mvn package

./run.sh
```

The `statistical-study` directory is just a playground for some R and IPython notebooks.
There I studied the data visually trying to find the ARIMA parameters best suited for my data.

License (MIT)
=============
Copyright 2017 (c) Barbu Paul - Gheorghe

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
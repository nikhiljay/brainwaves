# Measuring Brainwaves

[![GitHub version](https://img.shields.io/badge/version-1.0-blue.svg)](https://github.com/nikhiljay/brainwaves/releases)
![](https://img.shields.io/badge/platform-ios%20%7C%20osx-lightgray.svg)
![](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)

This is my project for Advanced Authentic Research (<a href="http://aar.pausd.org" target="_blank">AAR</a>). Follow the progress of this project on my <a href="http://pugiblog.com/category/science/advanced-authentic-research/" target="_blank">blog</a>. This project uses <a href="https://github.com/openyou/emokit" target="_blank">emokit</a> which is an open source driver used to access the Emotiv Device raw data.

![](https://pugiblog.files.wordpress.com/2015/12/section1-epoc.png)

## Extracting the Raw Data

1) Download the repository

```
$ git clone https://github.com/nikhiljay/brainwaves.git
```

2) Plug in your <a href="https://emotiv.com" target="_blank">Emotiv</a>'s USB dongle.

3) Find the Serial Number of the Emotiv by downloading HIDAPI.

```
$ git clone https://github.com/signal11/hidapi.git
$ cd hidapi
```

4) In the HIDAPI go to the directory that corresponds to your operating system and run: 

```
$ make -f Makefile-manual
```

5) A hidtest file should be created in the same directory. Open the hidtest to run it.

6) The output should be a list of devices that are connected to the computer. Look at the Emotiv device information and copy the Serial Number.

7) In the brianwaves project, go to the emokit directory.

```
$ cd emokit/python/emokit
```

8) Open "emotiv.py" and paste the serial number on line 361 where it says:

```
serial_number=""
```

10) Run the "emotiv.py" file.

```
$ python emotiv.py
```

11) If there are any dependencies that need to be installed used the "pip" command.

```
$ sudo pip install [missing dependency goes here]
```

12) Install all dependencies until the following error is produced:

```
Traceback (most recent call last):
  File "emotiv.py", line 674, in <module>
    a.setup()
  File "emotiv.py", line 432, in setup
    self.setup_darwin()
  File "emotiv.py", line 537, in setup_darwin
    hidraw = hid.device(0x21a1, 0x0001)
  File "hid.pyx", line 45, in hid.device.__cinit__ (hid.c:1280)
```

9) Turn on the <a href="https://emotiv.com" target="_blank">Emotiv</a> and try again. A succesful output should be printed:

![](http://i.imgur.com/kKuvuHlm.png)

These electrodes in the picture above represent certain parts of the brain shown here:

![](http://i.imgur.com/xTtsqc7m.jpg)

## Displaying Data on an iOS Device

After extracting the Emotiv data, I sent the data as a JSON file to a <a href="https://ngrok.com" target="_blank">local server</a>. Then, I created an iOS app and used <a href="https://github.com/Alamofire/Alamofire" target="_blank">Alamofire</a> to get request the data from the server. I created the app so that it would display the raw data on the iOS device. Here is what it looks like so far:

![](https://media.giphy.com/media/nWbdCoU9LZfVe/giphy.gif)

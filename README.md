# Measuring Brainwaves and Monitoring Behavior
This is my project for Advanced Authentic Research (AAR). Follow the progress of this project on my <a href="http://pugiblog.com/category/science/advanced-authentic-research/" target="_blank">blog</a>. This project uses <a href="https://github.com/openyou/emokit" target="_blank">EmoKit</a> which is an open source driver used to access the Emotiv Device raw data.

![](https://pugiblog.files.wordpress.com/2015/12/section1-epoc.png)

## Usage

1) Download the repository

```
$ git clone https://github.com/nikhiljay/brainwaves.git
$ cd brainwaves-master
```

2) In the project, go to the python directory.

```
$ cd emokit/python/emokit
```

3) Connect your <a href="https://emotiv.com" target="_blank">Emotiv</a>.

4) Open "emotiv.py" and change the serial number on line 361 to your Emotiv's serial number.

5) Run the "example.py" file.

```
$ python example.py
```

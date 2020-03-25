## Motion Addon
Addon to use a usb camera with motion detection, based on https://motion-project.github.io/

### Current status
Currently only working for the first webcam found at /dev/video0

### Changelog
|Version|Changes|
|-------|-------|
|2.1    | Added webcontrol configuration |
|2.0    | Changed base image to debian:jessie. Size is now bigger, but finally stable!|
|1.0    | Inital release. A bit unstable|

### Home Assistant integration
```
camera:
  - platform: local_file
    name: Living Room Cam
    file_path: /share/motion/lastsnap.jpg
```

### Settings
##### config
*Optional*

Path to a predefined motion.conf settings file

##### videodevice
*/dev/video0*

##### width
*640*

Image width (pixels). Valid range: Camera dependent

##### height
*480*

Image height (pixels). Valid range: Camera dependent

##### framerate
*2*

Maximum number of frames to be captured per second.  
Valid range: 2-100. Default: 100 (almost no limit).

##### text_right
*%Y-%m-%d %T-%q*


Draws the timestamp using same options as C function strftime(3)  
Text is placed in lower right corner

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### target_dir
*/share/motion*

Target base directory for pictures and films  
Use absolute path.

##### snapshot_interval
*30*

Make automated snapshot every N seconds (0 = disabled)

##### snapshot_name
*%v-%Y%m%d%H%M%S-snapshot*

File path for snapshots (jpeg or ppm) relative to target_dir  
Default value is equivalent to legacy oldlayout option  
For Motion 3.0 compatible mode choose: %Y/%m/%d/%H/%M/%S-snapshot  
File extension .jpg or .ppm is automatically added so do not include this.  
Note: A symbolic link called lastsnap.jpg created in the target_dir will always point to the latest snapshot, unless snapshot_filename is exactly 'lastsnap'

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### picture_output
*on*

Output 'normal' pictures when motion is detected  
Valid values: on, off, first, best, center  
When set to 'first', only the first picture of an event is saved.  
Picture with most motion of an event is saved when set to 'best'.  
Picture with motion nearest center of picture is saved when set to 'center'.  
Can be used as preview shot for the corresponding movie.

##### picture_name
*%v-%Y%m%d%H%M%S-%q*

File path for motion triggered images (jpeg or ppm) relative to target_dir  
Default value is equivalent to legacy oldlayout option  
For Motion 3.0 compatible mode choose: %Y/%m/%d/%H/%M/%S-%q  
File extension .jpg or .ppm is automatically added so do not include this  
Set to 'preview' together with best-preview feature enables special naming convention for preview shots. See motion guide for details

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### webcontrol_local
*on*

Restrict control connections to localhost only

##### webcontrol_html
*on*

Output for http server, select off to choose raw text plain

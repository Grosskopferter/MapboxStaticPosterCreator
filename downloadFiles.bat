del *.png

set lon=128670
set lonstep=-6867
set lonsteps=1
set /A lonEnd=%lon%+(%lonstep%*%lonsteps%)

set lat=570340
set latstep=6867
set latsteps=1
set /A latEnd=%lat%+(%latstep%*%latsteps%)

set zoom=17.0
for /l %%o in (%lon%, %lonstep%, %lonEnd%) do for /l %%a in (%lat%, %latstep%, %latEnd%) do (curl https://api.mapbox.com/styles/v1/mapbox/outdoors-v10/static/11.%%a,48.%%o,%zoom%,0,0/1280x1280@2x?access_token=%MAPBOX_ACCESS_KEY% --output %%o-%%a.png)

for /l %%o in (%lon%, %lonstep%, %lonEnd%) do (magick convert %%o-*.png +append vert-%%o.png)

magick convert vert-*.png -append result.png


start /b "C:\Program Files\IrfanView\i_view64.exe" result.png
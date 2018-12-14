del *.png
set lat=57034
set lon=12867
set lonstep=100
set lonsteps=4
set /A lonEnd=%lon%+(%lonstep%*%lonsteps%)

set lat=57034
set latstep=1000
set latsteps=1
set /A latEnd=%lat%+(%latstep%*%latsteps%)

set zoom=17.0
for /l %%l in (%lat%, %latstep%, %latEnd%) do (curl https://api.mapbox.com/styles/v1/mapbox/outdoors-v10/static/11.%%l,48.%lon%,%zoom%,0,0/1280x1280@2x?access_token=%MAPBOX_ACCESS_KEY% --output %%l.png)

magick convert *.png +append result.png

start /b "C:\Program Files\IrfanView\i_view64.exe" result.png
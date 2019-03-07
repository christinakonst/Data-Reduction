stsdas 

imdel crrdatar0001.fits
imdel crrdatar0002.fits
imdel arcr0001.fits
imdel arc0001.fits
imdel xxx.pl
imdel xxx2.pl
imdel sub1
imdel sub2
imdel sum
imdel xxx
imdel yyy
imdel zzz
imdel test
imdel test2
imdel test3
imdel test4
imdel test5
imdel test6
imdel diff1
imdel spec1
imdel diff2
imdel arcsub

#science frames
imcopy ALBh140105.fits[1] test
imstat ("test.fits[*,2070:2097]", fields = "mean", format-) | scan(x)
= x
imarith ("test","-",x,"test2")
imarith ("test2","-","../specBIAS.fits","test3")
imarith ("test3","/","../specflatg4s1.fits","test4")
imarith ("test4","+",1000,"test5")
wfits test5[*,50:1750] test6
lacos_spec test6.fits crrdatar0001.fits xxx.pl sigclip=4.5 niter=3 gain=0.7

imdel xxx.pl 
imdel test
imdel test2
imdel test3
imdel test4
imdel test5
imdel test6

imcopy ALBh140106.fits[1] test
imstat ("test.fits[*,2070:2097]", fields = "mean", format-) | scan(x)
= x
imarith ("test","-",x,"test2")
imarith ("test2","-","../specBIAS.fits","test3")
imarith ("test3","/","../specflatg4s1.fits","test4")
imarith ("test4","+",1000,"test5")
wfits test5[*,50:1750] test6
lacos_spec test6.fits crrdatar0002.fits xxx.pl sigclip=4.5 niter=3 gain=0.7

wfits crrdatar0001.fits[5:205,*] yyy
imarith ("yyy", "+", 500., "zzz")
rotate zzz sub1 90 ncols=0 nlines=0

imdel yyy 
imdel zzz 

wfits crrdatar0002.fits[192:392,*] yyy
imarith ("yyy", "+", 500., "zzz")
rotate yyy sub2 90 ncols=0 nlines=0

imarith sub1 + sub2 spec1

imdel zzz 

#Also the arc frame
imcopy ALBh140107.fits[1] arc0001
imstat ("arc0001.fits[*,2060:2101]", fields = "mean", format-) | scan(x)
= x
imarith ("arc0001","-",x,"arcr0001")
wfits arcr0001[50:250,50:1750] zzz
rotate zzz arcsub 90 ncols=0 nlines=0

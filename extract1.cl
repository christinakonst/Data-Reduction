#GRB050401  imred/ccdred/ kpnoslit
#===============================================================
noao 
imred
ccdred
twodspec
apextract 

imdel spek1
imdel spek11d
imdel spek121d
imdel spek12
imdel spek13
imdel arc1d
imdel arc
imdel comb_1d.fits
imdel arc_1d.fits
imdel comb_1dw.fits
rfits fits_fil=spec1.fits file_lis="" iraf_fil=spek1
rfits fits_fil=arcsub.fits file_lis="" iraf_fil=arc
ccdhedit images=spek1 parameter="dispaxis" value=1 
ccdhedit images=arc parameter="dispaxis" value=1 
apfind input=spek1 find=no reference="" edit=yes interact=yes line=1200 nsum=150 nfind=1 
apall input=spek1 output=spek11d reference="" interac=yes find=no line=1200 edit=yes nsum=150 recenter=no trace=yes extras=yes weight="variance" back=average
apall input=arc output=arc1d ref=spek1 recenter=no trace=no back=none interac=no weights="none"            
imdel arc_1d.fits
wfits iraf_file=arc1d fits_file=arc_1d.fits

identify arc_1d.fits coordli=/iraf/iraf/noao/lib/linelists/skylines.dat niterat=5 ord=6 funct=cheb fwidt=7.
ccdhedit images=spek1 parameter="refspec1" value="xxx"
ccdhedit images=spek11d parameter="refspec1" value="xxx"
hedit spek1 fields="REFSPEC1" value="arc_1d.fits"  
hedit spek11d fields="REFSPEC1" value="arc_1d.fits"  
dispcor input=spek1 output=spek12 lineari=yes 
dispcor input=spek11d output=spek121d lineari=yes 
imdel spec1_1dw.fits
imdel spec1_skysubw.fits
imdel spec1w.fits
wfits iraf_fil=spek12 fits_fil="spec1_skysubw.fits"   
wfits iraf_fil=spek121d fits_fil="spec1_1dw.fits"   


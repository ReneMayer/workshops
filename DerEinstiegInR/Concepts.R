## @knitr Con

rm(list=ls(all=TRUE))

vl <- c(TRUE,FALSE,TRUE,TRUE,FALSE)

vn <- c(Africa=44.7, Asia=59.0, Austra=63.7, Euro=68.0, nAmrca=66.9, sAmrca=60.8)

vc <- c('Africa', 'Asia', 'Australia', 'Europe', 'NorthAmerica', 'SouthAmerica')

mn <- matrix(c(44.7, 44.0,   3.2, 393.9,
		      59.0, 340.0,  4.6, 1520.8,
		      63.7, 1126.6, 5.9, 1464.0,
		      68.0, 1983.9, 6.9, 2065.9,
		      66.9, 1532.8, 6.6, 1018.5,
		      60.8, 174.8,  5.0, 902.0),
             ncol=4, byrow=T)

dfm <- data.frame(vc, mn)
names(dfm) = c( 'Continent', 'LE',  'HealthExpPC', 'LogHE', 'CigCon')

lm=list(x=1:4, y=1:6, z=c('a','b'),mn)

# with(S, table( cut(LE,3), Continent))
an<-
 array(   data = c(27,17,7,1,23,19,0,6,7,0,3,42,1,0,14,0,6,13),
           dim = c(3,6),
      dimnames = list(       LE = c('29-44','44-60', '60-75'),
                      Continent = c('Afr', 'Asi', 'Aust', 'Eur', 'nAm', 'sAm')
               )
      )

tab <- as.table( an )
rm(an)
## get stock quotes

library(tseries)
library(xts)

library(BatchGetSymbols)

# set dates
first.date <- "2018-04-01"

freq.data <- 'daily'
# set tickers
tickers <- c('TSLA' )

l.out <- BatchGetSymbols(tickers = tickers, 
                         first.date = first.date,
#                         last.date = last.date, 
                         freq.data = freq.data,
                         cache.folder = file.path(tempdir(), 
                        'BGS_Cache') ) # cache in tempdir()

head(l.out)


## stock names:
plot(l.out$df.tickers$volume[l.out$df.tickers$ticker == "TSLA"]/1.e5,type='l',
     ylab = 'volume (10000s)', xlab = 'day', main='Tesla')
grid()

plot(l.out$df.tickers$price.close[l.out$df.tickers$ticker == "TSLA"],
     type='l', ylab = 'price $', xlab = 'day', main="Tesla")
grid()


write.csv(l.out$df.tickers, file = 'TESLA.csv')


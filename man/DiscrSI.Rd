\encoding{UTF-8}

\name{DiscrSI}
\alias{DiscrSI}
\title{Discretized Generation Time Distribution Assuming A Shifted Gamma Distribution}
\description{
  \code{DiscrSI} computes the discrete distribution of the serial interval, assuming that the serial interval is shifted Gamma distributed, with shift 1. 
}
\usage{
DiscrSI(k, mu, sigma)
}
\arguments{
  \item{k}{positive integer for which the discrete distribution is desired.}
  \item{mu}{a positive real giving the mean of the Gamma distribution.}
  \item{sigma}{a non-negative real giving the standard deviation of the Gamma distribution.}
}
\value{
  \code{DiscrSI(k, mu, sigma)} gives the discrete probability \eqn{w_k} that the serial interval is equal to \eqn{k}.
}
\seealso{\code{\link{OverallInfectivity}}, \code{\link{EstimateR}}
}
\references{
  Cori, A. et al. A new tool to estimate time-varying reproduction numbers during epidemics. (submitted) 
}
\details{
  Assuming that the serial interval is shifted Gamma distributed with mean \eqn{\mu}, standard deviation \eqn{\sigma} and shift \eqn{1}, 
  the discrete probability \eqn{w_k} that the serial interval is equal to \eqn{k} is: 
  \cr
  \eqn{w_k = kF_{\{\mu-1,\sigma\}}(k)+(k-2)F_{\{\mu-1,\sigma\}}(k-2)-2(k-1)F_{\{\mu-1,\sigma\}}(k-1)\\+(\mu-1)(2F_{\{\mu-1+\frac{\sigma^2}{\mu-1},\sigma\sqrt{1+\frac{\sigma^2}{\mu-1}}\}}(k-1)-F_{\{\mu-1+\frac{\sigma^2}{\mu-1},\sigma\sqrt{1+\frac{\sigma^2}{\mu-1}}\}}(k-2)-F_{\{\mu-1+\frac{\sigma^2}{\mu-1},\sigma\sqrt{1+\frac{\sigma^2}{\mu-1}}\}}(k))}
 \cr
  where \eqn{F_{\{\mu,\sigma\}}} is the cumulative density function of a Gamma distribution with mean \eqn{\mu} and standard deviation \eqn{\sigma}.
}
\author{ Anne Cori \email{a.cori@imperial.ac.uk} }
\examples{
## Computing the discrete serial interval of influenza
MeanFluSI <- 2.6
SdFluSI <- 1.5
DicreteSIDistr <- vector()
for(i in 0:20)
{
    DicreteSIDistr[i+1] <- DiscrSI(i, MeanFluSI, SdFluSI)
}
plot(0:20, DicreteSIDistr, type="h", lwd=10, lend=1, xlab="time (days)", ylab="frequency")
title(main="Discrete distribution of the serial interval of influenza")
}
\keyword{distribution}

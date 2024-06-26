% File src/library/base/man/isR.Rd
% Part of the R package, https://www.R-project.org
% Copyright 1995-2024 R Core Team
% Distributed under GPL 2 or later

\name{is.R}
\title{Are we using R, rather than S?}
\usage{
is.R()
}
\alias{is.R}
\description{
  Test if running under \R.
}

\details{
  The function was been written ca 2007 such as to correctly run in all
  historical versions of \R, S and S-PLUS.
  In order for code to be runnable in both \R and S dialects previous to
  S-PLUS 8.0, your code must either define \code{is.R} or use it as

  \code{if (exists("is.R") && is.function(is.R) && is.R()) \{}\cr
  \code{    }\emph{## R-specific code}\cr
  \code{\} else \{}\cr
  \code{    }\emph{## S-version of code}\cr
  \code{\}}

  (and this will only work if all of the code is parseable
  under all possible dialects).

  Note that it does not actually demonstrate that it is being run under
  \R, rather that is not being run under a long-obsolete version of S or
  S-PLUS.  It will be deprecated in future versions of \R.
}
\value{
  \code{is.R} returns \code{TRUE} if we are using \R and \code{FALSE}
  otherwise.
}
\seealso{\code{\link{R.version}}, \code{\link{system}}.}
\examples{
x <- stats::runif(20); small <- x < 0.4
## In the early years of R, 'which()' only existed in R:
if(is.R()) which(small) else seq(along = small)[small]
## but it would have been better to test if 'which' existed.
}
\keyword{environment}
\keyword{utilities}

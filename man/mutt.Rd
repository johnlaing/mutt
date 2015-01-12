\name{mutt}
\alias{mutt}
\title{Mutt E-mail Client}
\description{Interface to the Mutt E-mail Client}
\usage{
  mutt(to=c(), subject=NULL, body=NULL, body.file=NULL, body.html=FALSE, cc=NULL, bcc=NULL, from=NULL)
}
\arguments{
  \item{to}{vector of recipient addresses}
  \item{subject}{email subject}
  \item{body}{email content, as character vector}
  \item{body.file}{email content, path to file}
  \item{body.html}{should we set a header to treat content as HTML?}
  \item{cc}{vector of carbon copy recipient addresses}
  \item{bcc}{vector of blind carbon copy recipient addresses}
  \item{from}{address of sender}
}
\examples{
  \dontrun{
    if (exists("my.email")) {
      mutt(my.email, "testing", "vanilla email")
      mutt(my.email, "testing", "<p>html email</p>", body.html=TRUE)
      mutt(my.email, "testing", "from testing", from="testing")
      mutt(cc=my.email, subject="testing", body="carbon copy")
      mutt(bcc=my.email, subject="testing", body="blind carbon copy")
    }
  }
}

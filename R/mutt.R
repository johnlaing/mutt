mutt <- function(to=c(), subject=NULL, body=NULL, body.file=NULL, body.html=FALSE, cc=NULL, bcc=NULL, from=NULL) {
    args <- character()
    if (body.html) args <- c(args, "-e", shQuote("my_hdr Content-Type: text/html"))
    if (!is.null(subject)) args <- c(args, "-s", shQuote(as.character(subject)))
    if (!is.null(cc)) args <- c(args, rbind("-c", shQuote(as.character(cc))))
    if (!is.null(bcc)) args <- c(args, rbind("-b", shQuote(as.character(bcc))))
    if (length(to)) args <- c(args, "--", shQuote(to))

    if (!is.null(body)) {
        stdin <- ""
        input <- as.character(body)
    } else if (!is.null(body.file)) {
        stdin <- body.file
        input <- NULL
    } else {
        stdin <- ""
        input <- NULL
    }

    if (!is.null(from)) {
        env <- paste0("EMAIL=", from)
    } else {
        env <- character()
    }

    system2("mutt", args=args, stdin=stdin, input=input, env=env)
}

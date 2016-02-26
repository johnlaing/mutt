mutt <- function(to=c(), subject=NULL, body=NULL, body.file=NULL, body.html=FALSE, cc=NULL, bcc=NULL, from=NULL, attachments=NULL) {
    args <- character()
    if (body.html) args <- c(args, "-e", shQuote("set content_type=text/html")) ## tip from http://stackoverflow.com/a/22179398
    if (!is.null(subject)) args <- c(args, "-s", shQuote(as.character(subject)))
    if (!is.null(cc) & length(cc) > 0) args <- c(args, rbind("-c", shQuote(as.character(cc))))
    if (!is.null(bcc) & length(bcc) > 0) args <- c(args, rbind("-b", shQuote(as.character(bcc))))
    if (!is.null(attachments) & length(attachments) > 0) {
        args <- c(args, rbind("-a", shQuote(as.character(attachments))))
    }
    if (length(to) > 0) args <- c(args, "--", shQuote(to))

    if (!is.null(body)) {
        stdin <- ""
        input <- as.character(body)
    } else if (!is.null(body.file)) {
        stdin <- body.file
        input <- NULL
    } else {
        stdin <- ""
        input <- ""
    }

    if (!is.null(from)) {
        env <- paste0("EMAIL=", from)
    } else {
        env <- character()
    }

    system2("mutt", args=args, stdin=stdin, input=input, env=env)
}

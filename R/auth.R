#' @title Query a week from PAADC API
#' @description This function will add a username and a password to your
#'   \code{.Renviron} file so it can be called securely without being stored in
#'   your code. After you have installed your credentials, it can be called any time by
#'   typing \code{Sys.getenv("PAADC_USER")} or \code{Sys.getenv("PAADC_PW")}. If you do not have an \code{.Renviron} file, the
#'   function will create one for you.
#' @param user The username
#' @param pw The password
#' @export paadcr_auth
#' @examples
#'
#' \dontrun{
#'
#' # Just run \code{paadcr_auth()} and the function will take care of the rest.
#' paadcr_auth()
#'
#' }
paadcr_auth <- function(user, pw) {


    if(missing(user) | missing(pw)){
        user <- rstudioapi::askForPassword("Please type in your username")
        pw <- rstudioapi::askForPassword("Please type in your password:")
    }

    if(is.null(user)|is.null(pw)){
        warning("You didn't specify a password or user.")
        return(invisible())
    }

    set_renv(PAADC_USER = user)
    set_renv(PAADC_PW = pw)

    message("Username and PW set. If you want to use a different username just run paadcr_auth again.")
}

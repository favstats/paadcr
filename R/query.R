#' @title Query a week
#' @description This function will retrieve data from any given week of the API.
#' @param week Specify the week as numeric. For example for Week 2:  Jan 11 - 17 2021.
#' @param clean clean the dataset
#' @export paadcr_week
#' @examples
#'
#' \dontrun{
#'
#' # Query week 2:
#' paadcr_week(2)
#'
#' }
paadcr_week <- function(week, clean = F) {

    PAADC_USER <- Sys.getenv("PAADC_USER")
    PAADC_PW <- Sys.getenv("PAADC_PW")

    if(PAADC_USER == "" | PAADC_PW == ""){
        stop("No user or password detected. Please authenticate using paadcr_auth()")
    }

    res <- httr::GET(paste0("https://paadc.tracking.exposed/api/v2/ad/", week),
                     httr::accept_json(),
                     httr::authenticate(PAADC_USER, PAADC_PW)
    )

    cont <- httr::content(res)

    if(!clean){

        final <- cont

    } else if (clean){

        final <- tibble::tibble(cont) %>%
            tidyr::unnest_wider(cont)


    }

    return(final)

}

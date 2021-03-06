library(tercen)
library(dplyr)

options("tercen.workflowId" = "f81d245ef22a2ff192ed2533a6002ec3")
options("tercen.stepId"     = "5048c052-db65-475b-a9ac-97733e2b8d0d")

getOption("tercen.workflowId")
getOption("tercen.stepId")

do.lm <- function(df) {
  
  out <- data.frame(
    .ri = df$.ri[1],
    .ci = df$.ci[1],
    intercept = NaN,
    slope = NaN,
    fit.y = rep(NaN, 2),
    fit.x = rep(NaN, 2)
  )
  
  intercept.omit <- as.logical(ctx$op.value('intercept.omit'))
  if(intercept.omit) {
    mod <- try(lm(.y ~ .x - 1, data = df))
  } else {
    mod <- try(lm(.y ~ .x, data = df))
  }
  
  
  if(!inherits(mod, 'try-error')) {
    out$intercept <- mod$coefficients[1]
    out$slope <- mod$coefficients[2]
    out$fit.y <- range(mod$fitted.values)
    out$fit.x <- range(df$.x)
  }
  return(out)
  
}

ctx <- tercenCtx()

if(inherits(try(ctx$select(".x")), 'try-error')) stop("x axis is missing.")
if(inherits(try(ctx$select(".y")), 'try-error')) stop("y axis is missing.")

ctx %>%
  select(.x, .y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  do(do.lm(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()

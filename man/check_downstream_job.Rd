% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rstudio_jobs.R
\name{check_downstream_job}
\alias{check_downstream_job}
\title{Check & install downstream job}
\usage{
check_downstream_job(
  project = ".",
  verbose = 1,
  create_args = list(renv_profile = Sys.getenv("RENV_PROFILE")),
  ...
)
}
\arguments{
\item{project}{(\code{character}) If \code{project_type} is \code{local} then
directory of project (for which to calculate the dependency structure);
must be a git repository. If \code{project_type} is \code{repo@host} then should
be character of the form \verb{openpharma/stageddeps.food@https://github.com}
If host is not included in the string then the default \verb{https://github.com}
is assumed.}

\item{verbose}{(\code{numeric}) verbosity level, incremental;
(0: None, 1: packages that get installed + high-level git operations,
2: includes git checkout infos)}

\item{create_args}{\code{named list} - additional arguments passed to \code{dependency_table} function}

\item{...}{
  Arguments passed on to \code{\link[=check_downstream]{check_downstream}}
  \describe{
    \item{\code{distance}}{(\code{numeric}) additional filter to only install downstream
packages at most this distance from the \code{dependency_structure$current_pkg}
(advanced use only)}
    \item{\code{check_args}}{(\code{list}) arguments passed to \code{rcmdcheck}}
    \item{\code{only_tests}}{(\code{logical}) whether to only run tests (rather than checks)}
    \item{\code{dep_structure}}{(\code{dependency_structure}) output of function
\code{dependency_table}; uses \code{dep_structure$table} to infer the packages
to apply action to and infer installation order;
uses \code{dep_structure$deps} to infer upstream dependencies}
    \item{\code{install_external_deps}}{logical to describe whether to install
external dependencies of package using \code{\link[remotes:install_deps]{remotes::install_deps()}} (or \code{\link[renv:install]{renv::install()}} if
inside an renv environment) .}
    \item{\code{upgrade}}{argument passed to \code{\link[remotes:install_deps]{remotes::install_deps()}}, defaults to \code{'never'}. Ignored
if inside an \code{renv} environment.}
    \item{\code{package_list}}{(\code{character}) If not NULL, an additional filter, only packages on this
list will be considered and their dependencies installed if needed (advanced usage only).}
    \item{\code{dry}}{(\code{logical}) dry run that outputs what would happen without actually
doing it.}
  }}
}
\description{
Check & install downstream job
}
\examples{
\dontrun{
check_downstream_job(check_args = Sys.getenv("RCMDCHECK_ARGS"))
check_downstream_job(
  check_args = Sys.getenv("RCMDCHECK_ARGS"),
  list(create_arg = list(ref = "6_makegraph@main"))
)
check_downstream_job(only_tests = TRUE)
}
}
\seealso{
check_downstream
}

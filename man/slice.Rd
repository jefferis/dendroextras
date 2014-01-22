\name{slice}
\alias{slice}
\title{Cut a tree-like object into groups numbered in tree order}
\usage{
  slice(x, k = NULL, h = NULL, ...)
}
\arguments{
  \item{x}{tree like object}

  \item{k}{an integer scalar with the desired number of
  groups}

  \item{h}{numeric scalar with height where the tree should
  be cut}

  \item{...}{Additional parameters passed to methods}
}
\value{
  a named vector with group memberships
}
\description{
  In comparison with cutree, the groups are numbered from
  left to right as per the tree when plotted in its
  standard horizontal form. Note also that the return value
  will have the leaves sorted in dendrogram order.
}
\examples{
hc <- hclust(dist(USArrests), "ave")
# return groups, leaves ordered by dendrogram
slice(hc,k=5)
# return groups, leaves ordered as originally passed to hclust
slice(hc,k=5)[order(hc$order)]
}
\author{
  jefferis
}
\seealso{
  \code{\link{cutree},\link{cut.dendrogram},\link{rect.hclust}}
}


\name{colour_clusters}
\alias{color_clusters}
\alias{colour_clusters}
\title{Colour sub-clusters of a tree (dendrogram/hclust) object}
\usage{
  colour_clusters(d, k = NULL, h = NULL, col = rainbow,
    groupLabels = NULL)
}
\arguments{
  \item{d}{A \code{dendrogram} or \code{hclust} tree
  object}

  \item{k}{number of groups (passed to \code{slice})}

  \item{h}{height at which to cut tree (passed to
  \code{slice})}

  \item{col}{Function or vector of colours}

  \item{groupLabels}{If TRUE add numeric group label - see
  Details for options}
}
\value{
  a tree object of class dendrogram.
}
\description{
  The distinctive feature of this function is to colour
  both the terminal leaves of a cluster and the edges
  leading to those leaves. The edgePar attribute of nodes
  will be augmented by a new list item col. The groups will
  be defined by a call to \code{\link{slice}} using the k
  or h parameters.
}
\details{
  If \code{groupLabels=TRUE} then numeric group labels will
  added to each cluster. If a vector is supplied then these
  entries will be used as the group labels. If a function
  is supplied then it will be passed a numeric vector of
  groups (e.g. 1:5) and must return the formatted group
  labels.
}
\examples{
d5=colour_clusters(hclust(dist(USArrests), "ave"),5)
plot(d5)
d5g=colour_clusters(hclust(dist(USArrests), "ave"),5,groupLabels=TRUE)
plot(d5g)
d5gr=colour_clusters(hclust(dist(USArrests), "ave"),5,groupLabels=as.roman)
plot(d5gr)
}
\author{
  jefferis
}
\seealso{
  \code{\link{slice},\link{cutree},\link{dendrogram}}
}


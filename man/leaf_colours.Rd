\name{leaf_colours}
\alias{leaf_colors}
\alias{leaf_colours}
\title{Return the leaf colours of a dendrogram}
\usage{
leaf_colours(d, col_to_return = c("edge", "node", "label"))
}
\arguments{
  \item{d}{the dendrogram}

  \item{col_to_return}{Character scalar - kind of colour
  attribute to return}
}
\value{
named character vector of colours, NA_character_ where
missing
}
\description{
Return the leaf colours of a dendrogram
}
\details{
The returned colours will be in dendrogram order.
}
\examples{
d5=colour_clusters(hclust(dist(USArrests), "ave"),5)
leaf_colours(d5)
}
\author{
jefferis
}
\seealso{
\code{\link{slice},\link{colour_clusters}}
}


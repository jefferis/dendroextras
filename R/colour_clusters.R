#' Colour sub-clusters of a tree (dendrogram/hclust) object
#' 
#' The distinctive feature of this function is to colour both the 
#' terminal leaves of a cluster and the edges leading to those leaves.
#' The edgePar attribute of nodes will be augmented by a new list item col.
#' The groups will be defined by a call to \code{\link{slice}} using the k or h
#' parameters.
#' @param d A \code{dendrogram} or \code{hclust} tree object
#' @param k number of groups (passed to \code{slice})
#' @param h height at which to cut tree (passed to \code{slice})
#' @param col Function or vector of colours
#' @param addGroupLabel Whether to add a numeric label to each group
#' @return a tree object of class dendrogram.
#' @author jefferis
#' @export
#' @seealso \code{\link{slice},\link{cutree},\link{dendrogram}}
#' @examples
#' d5=colour_clusters(hclust(dist(USArrests), "ave"),5)
#' plot(d5)
colour_clusters<-function(d,k=NULL,h=NULL,col=rainbow,addGroupLabel=FALSE){
  # TODO make this more modular
  if(!inherits(d,'dendrogram') && !inherits(d,'hclust'))
    stop("Expects a dendrogram or hclust object")
  g=slice(d,k=k,h=h)
  if(inherits(d,'hclust')) d=as.dendrogram(d)
  
  k=max(g)
  if(is.function(col)) col=col(k)
  else if(length(col)!=k) stop("Must give same number of colours as clusters")
  
  addcol<-function(n,col) {
    attr(n,'edgePar')=c(attr(n,'edgePar'),list(col=col))
    n
  }
  
  descendTree<-function(sd){
    groupsinsubtree=unique(g[labels(sd)])
    if(length(groupsinsubtree)>1){
      # keep descending 
      for(i in seq(sd))
        sd[[i]]<-descendTree(sd[[i]])
    } else {
      # else assign colours
      # sd=dendrapply(sd,addcol,col[groupsinsubtree],groupsinsubtree)
      sd=dendrapply(sd,addcol,col[groupsinsubtree])
      if(addGroupLabel)
        attr(sd,'edgetext')=groupsinsubtree
    }
    sd
  }
  descendTree(d)
}

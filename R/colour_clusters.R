#' @export 
colour_clusters<-function(d,k=NULL,h=NULL,col=rainbow,addGroupLabel=FALSE){
  # TODO make this more modular
  g=slice(d,k=k,h=h)
  
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

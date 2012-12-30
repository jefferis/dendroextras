context("Test colouring of dendrograms")

test_that("Colour a dendrogram by cluster identity", {
      hc <- hclust(dist(USArrests), "ave")
      dend <- as.dendrogram(hc)
      cdend2 <- colour_clusters(dend,k=2,col=c("red",'green'))
      leafcolours <- unlist(dendrapply(cdend2,function(n) 
                if(is.leaf(n)) structure(attr(n,'edgePar')$col,
                      .Names=attr(n,'label')) else NULL))
      expect_that(labels(hc), equals(names(leafcolours)))
      expect_equivalent(rep(c("red",'green'),c(16,34)),leafcolours)
      
      colours5=c("red",'green','blue','cyan','magenta')
      cdend5 <- colour_clusters(dend,k=5,col=colours5)
      leafcolours <- unlist(dendrapply(cdend5,function(n) 
                if(is.leaf(n)) structure(attr(n,'edgePar')$col,
                      .Names=attr(n,'label')) else NULL))
      expect_that(labels(hc), equals(names(leafcolours)))
      expect_equivalent(rep(colours5,c(2L,14L,14L,10L,10L)),leafcolours)
    })

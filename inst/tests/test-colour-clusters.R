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

test_that("Colouring a dendrogram by cutting on height or number of groups", {
      hc <- hclust(dist(USArrests), "ave")
      dend <- as.dendrogram(hc)
      colours5=c("red",'green','blue','cyan','magenta')
      cdendk5 <- colour_clusters(dend,k=5,col=colours5)
      cdendh50 <- colour_clusters(dend,h=50,col=colours5)
      
      expect_that(cdendk5, equals(cdendh50))
    })

test_that("Can cut/colour an hclust object returning a dendrogram", {
      hc <- hclust(dist(USArrests), "ave")
      dend <- as.dendrogram(hc)
      colours5=c("red",'green','blue','cyan','magenta')
      cdendk5 <- colour_clusters(dend,k=5,col=colours5)
      chck5 <- colour_clusters(hc,k=5,col=colours5)
      
      expect_that(cdendk5, equals(chck5))
    })


dotplot2 = function(x,ntop=10,padj=0.05,type="up",font.size=5){
  dot_df = x
  dot_df = dot_df[dot_df$p.adjust <= padj,]
  dot_df = dot_df[order(dot_df$p.adjust),]
  dot_df$type = "upregulated"
  dot_df$type[dot_df$NES < 0] = "downregulated"
  dot_df$GeneRatio = sapply(strsplit(dot_df$leading_edge,", "),function(x)x[3])
  dot_df$GeneRatio = sapply(strsplit(dot_df$GeneRatio,"=|%"),function(x)as.numeric(x[2]))
  
  if(type=="up"){
    df = dot_df[dot_df$type== "upregulated",]
  }else if(type=="down"){
    df = dot_df[dot_df$type== "downregulated",]
  }else{
    stop("invalid argument for type!")
  }
  
  if(nrow(df) <= ntop){ntop=nrow(df)}
  ggplot(df[1:ntop,], aes(x = GeneRatio, y = fct_reorder(Description, GeneRatio))) + 
    geom_point(aes(size = GeneRatio, color = p.adjust)) +
    theme_bw(base_size = font.size) +
    scale_colour_gradient(limits=c(0, padj), low="red") +
    ylab(NULL) +
    ggtitle("GO pathway enrichment")
}

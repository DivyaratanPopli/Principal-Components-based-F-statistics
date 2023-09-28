library(ggplot2)
library("ggpubr")
library(tidyr)

#ppcaf="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/missing_ppca/simfiles_test/Ne1000/split_times1000/mu0/run1/npop10_nind100/pcs_method_ppca_direct/pcs_npcs10.csv"
#indf="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/missing_ppca/simfiles_test/Ne1000/split_times1000/mu0/run1/npop10_nind100/eigen.ind"

plot_pcs <- function(ppcaf, indf, pcplot1,pcplot2){
  

  pc=read.csv(file=ppcaf, header=F, sep=',')
  
  inds=read.csv(file=indf, header=F, sep='\t')
  
  df=as.data.frame(cbind(inds$V1, t(pc[1,]*(-1)), t(pc[2,])))
  df$pop=unlist(lapply(strsplit(as.character(df$V1), "_"), '[[', 1))
  colnames(df) = c("ind", "pc1", "pc2", "pop")
  
  df[df$pop=="pop1","pop"]="X1"
  df[df$pop=="pop2","pop"]="X2"
  df[df$pop=="pop3","pop"]="X3"
  df[df$pop=="pop4","pop"]="X4"
  df[df$pop=="pop5","pop"]="X5"
  df[df$pop=="pop6","pop"]="X6"
  df[df$pop=="pop7","pop"]="X7"
  df[df$pop=="pop8","pop"]="X8"
  df[df$pop=="pop9","pop"]="X9"
  df[df$pop=="pop10","pop"]="X10"
  
  colors1 <- c("X5" = "black", "X1" = "red", "X2" = "blue", "X3"= "green", "X4" = "yellow2", "X6" = "yellow4", "X7" = "yellowgreen", "X8" = "cyan3", "X9" = "darkorange1", "X10" = "purple4")
  
  df$pc1=as.numeric(df$pc1)
  df$pc2=as.numeric(df$pc2)
  
  
  
  xx1=ggplot(df, aes(x=pc1, y=pc2, color=pop)) +
    geom_point() +
    #geom_point()
    scale_color_manual(values = colors1, name="Populations") +ylim(c(-0.25,0.2)) + xlim(c(-0.25,0.2)) +
    theme_bw() + theme(legend.position="none", axis.text=element_text(size=14),
                       axis.title=element_text(size=16)) +
    xlab("PC 1") + ylab("PC 2")
    
  library(dplyr)
  
  
  
  df=as.data.frame(cbind(inds$V1, t(pc[3,]*(-1)), t(pc[4,])))
  df$pop=unlist(lapply(strsplit(as.character(df$V1), "_"), '[[', 1))
  colnames(df) = c("ind", "pc1", "pc2", "pop")
  
  df$pc1=as.numeric(df$pc1)
  df$pc2=as.numeric(df$pc2)
  
  df[df$pop=="pop1","pop"]="X1"
  df[df$pop=="pop2","pop"]="X2"
  df[df$pop=="pop3","pop"]="X3"
  df[df$pop=="pop4","pop"]="X4"
  df[df$pop=="pop5","pop"]="X5"
  df[df$pop=="pop6","pop"]="X6"
  df[df$pop=="pop7","pop"]="X7"
  df[df$pop=="pop8","pop"]="X8"
  df[df$pop=="pop9","pop"]="X9"
  df[df$pop=="pop10","pop"]="X10"
  
  colors1 <- c("X5" = "black", "X1" = "red", "X2" = "blue", "X3"= "green", "X4" = "yellow2", "X6" = "yellow4", "X7" = "yellowgreen", "X8" = "cyan3", "X9" = "darkorange1", "X10" = "purple4")
  
  
  xx2=ggplot(df, aes(x=pc1, y=pc2, color=pop)) +
    geom_point() +
    #geom_point()
    scale_color_manual(values = colors1, name="Populations") +ylim(c(-0.25,0.2)) + xlim(c(-0.25,0.2)) +
    theme_bw() + theme(legend.position="none", axis.text=element_text(size=14),
                       axis.title=element_text(size=16)) +
    xlab("PC 3") + ylab("PC 4")
  
  
  figure1 <- ggarrange(xx1, xx2,
                      labels = c("", ""),
                      ncol = 2, nrow = 1, common.legend = TRUE, legend="bottom")
  
  ggsave(pcplot1, figure1,
         width = 8, height = 5, dpi = 300, units = "in", device='png')
  
  
  #next figure
  df1=as.data.frame(cbind(inds$V1, t(pc[1,]), t(pc[2,]), t(pc[3,]), t(pc[4,]), t(pc[5,]), t(pc[6,]), t(pc[7,]), t(pc[8,]) ))
  df1$pop=unlist(lapply(strsplit(as.character(df1$V1), "_"), '[[', 1))
  
  colnames(df1) = c("V1", "pc1", "pc2", "pc3","pc4", "pc5", "pc6","pc7", "pc8", "pop")
  df2 <- df1[, -which(names(df1) == 'V1')]
  
  df_long <- df2 %>%
    pivot_longer(cols = -pop, names_to = "PCname", values_to = "PCval")
  
  df_long$y=0
  df_long$PCval=as.numeric(df_long$PCval)
  
  df_long[df_long$pop=="pop1","pop"]="X1"
  df_long[df_long$pop=="pop2","pop"]="X2"
  df_long[df_long$pop=="pop3","pop"]="X3"
  df_long[df_long$pop=="pop4","pop"]="X4"
  df_long[df_long$pop=="pop5","pop"]="X5"
  df_long[df_long$pop=="pop6","pop"]="X6"
  df_long[df_long$pop=="pop7","pop"]="X7"
  df_long[df_long$pop=="pop8","pop"]="X8"
  df_long[df_long$pop=="pop9","pop"]="X9"
  df_long[df_long$pop=="pop10","pop"]="X10"
  
  
  pc_names <- list(
    "pc1"="PC 1",
    "pc2"="PC 2",
    "pc3"="PC 3",
    "pc4"="PC 4",
    "pc5"="PC 5",
    "pc6"="PC 6",
    "pc7"="PC 7",
    "pc8"="PC 8"
  )
  
  pc_labeller <- function(variable,value){
    return(pc_names[value])
  }
  
  
  figure2 <- ggplot(data=df_long, aes(x=PCval, y=y, color=pop), alpha=0.01) +
    geom_jitter(width = 0.00, height = 0.01) +
    facet_wrap(~PCname, ncol = 1, labeller = pc_labeller) +
    geom_point() +
    scale_color_manual(values = colors1, name="Populations") + theme_bw() +
    theme(axis.text.y = element_blank(), axis.ticks.y = element_blank(), axis.title.y = element_blank(), axis.line.y = element_blank(),panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(), strip.text.x = element_text(size = 9)) + xlab("Position of individuals on a PC")
   
  ggsave(pcplot2, figure2,
         width = 8, height = 6, dpi = 300, units = "in", device='png')
}

plot_pcs(ppcaf=snakemake@input[["ppcaf"]],
         indf=snakemake@input[["indf"]],
         pcplot1=snakemake@output[["pcplot1"]],
         pcplot2=snakemake@output[["pcplot2"]])





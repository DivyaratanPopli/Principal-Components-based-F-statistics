library(dplyr)
library(ggplot2)

#admf="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/neandertal_shrinkage/admixtools2/f3stats.csv"
#ppca_muf="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/neandertal_shrinkage/ppca_miss_val_scale2/mu.csv"
#ppca_stdf="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/neandertal_shrinkage/ppca_miss_val_scale2/std.csv"

plotf3 <- function(admf, ppca_muf, ppca_stdf, plotf){
  
  adm=read.csv(file=admf, header=F, sep=',')
  ppca_mu=read.csv(file=ppca_muf, header=F, sep=',')
  
  ppca_std=read.csv(file=ppca_stdf, header=F, sep=',')
  
  ppca1 = as.data.frame(cbind(ppca_mu, ppca_std))
  colnames(ppca1)=c('mu','std')
  ppca1$pop1=rep('Altai',6)
  ppca1$pop2=rep('Vindija33.19',6)
  ppca1$pop3=c('Les_Cottes_L35MQ25','Goyet_L35MQ25','Mezmaiskaya1_L35MQ25','Mezmaiskaya2_L35MQ25','VindijaG1_L35MQ25','Spy_L35MQ25')
  ppca1$method='ppca'
  
  
  adm1=adm[,1:5]
  colnames(adm1)=c('pop1','pop2','pop3','mu','std')
  adm1$method="admixtools"
  
  vec=full_join(ppca1, adm1) 
  
  f3_plot=ggplot(vec, aes(x=mu, y=pop3, color=method)) +
    geom_point() +
    geom_errorbar(aes(xmin=mu-2*std, xmax=mu+2*std), width=0.1) +
    theme_classic() + ylab('Poplation X') + xlab("F3(Altai ; Vindija33.19 , X)")
  
  ggsave(plotf, f3_plot,
         width = 8, height = 5, dpi = 300, units = "in", device='png')
}
  
plotf3(admf=snakemake@input[["admf"]],
         ppca_muf=snakemake@input[["ppca_muf"]],
         ppca_stdf=snakemake@input[["ppca_stdf"]],
         plotf=snakemake@output[["plotf"]])

library(ggplot2)


#admixf="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE_1ind/simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/admixtools2Norm/f2mat102"
#lsef=c("/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE_1ind/simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/PCA1_val/f2mat104","/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE_1ind/simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/PCA1_val/f2mat103","/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE_1ind/simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/PCA1_val/f2mat102")

plotf <- function(admixf, lsef, outplotf){
  
  admix = read.csv(file=admixf, header=F, sep=',')[1,4]
  
  xx1=c()
  for(fi in seq(1,length(lsef))){
    
    xx = read.csv(file=lsef[fi], header=F, sep=',')[1,4]
    xx1=append(xx1,xx)
    
  } 
  xx1=xx1/116762
  admix=admix/116762
  png(file=outplotf)
  plot(xx1, ylab="f2", xlab="Number of PCs")
  abline(h=admix, col="red")
  legend("bottomright", legend=c("LSE", "ADMIXTOOLS 2"),
         col=c("black", "red"), lty=c(NA,1), pch=c(1,NA))
  dev.off()
  
}

plotf(admixf=snakemake@input[["admixf"]],
       lsef=snakemake@input[["lsef"]],
       outplotf=snakemake@output[["outplotf"]])

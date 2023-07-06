
folder1="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE/"

rule pca_ppca:
    output:
        outf="plots/pca_ppca.png"
    script:
        "Rscripts/pca_ppca.R"

rule all_pca:
    output:
        outf="plots/pca_all.png"
    script:
        "Rscripts/pca_ppca_pca1.R"

rule all_pca_gen:
    input:
        genf="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/test_samplesize100/simfiles/Ne1000/split_times1000/mu0/run1/npop10_nind100/eigen.geno_pc"
    output:
        outf="plots/pca_all_genetic.png"
    script:
        "Rscripts/pca_ppca_pca_gen.R"

rule supp_PC_comparison_all_inds:
    input:
        flist=expand(folder1+"simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/avgAccuracy_{vals}_scale{npcs}", vals=["PCA1_val","pca_val","ppca_direct_val"], npcs=list(range(2,51))),
        slist=expand(folder1+"simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/stdDev_{vals}_scale{npcs}", vals=["PCA1_val","pca_val","ppca_direct_val"], npcs=list(range(2,51))),
        true=folder1+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat8",
    output:
        f2plot="plots/supplementary/Ne{Ne}_split_times{sp}_npop{npop}_nind{nind}_mu{mu}_f2_plot_scale_test.png"
    script:
        "scale_f2.R"

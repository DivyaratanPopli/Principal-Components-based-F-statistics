
folder1="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE/"
folder2="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE_1ind/"

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
        "Rscripts/scale_f2.R"

rule supp_PC_comparison_all_inds1:
    input:
        flist=expand(folder2+"simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/avgAccuracy_{vals}_scale{npcs}", vals=["PCA1_val","pca_val","ppca_direct_val"], npcs=list(range(2,51))),
        slist=expand(folder2+"simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/stdDev_{vals}_scale{npcs}", vals=["PCA1_val","pca_val","ppca_direct_val"], npcs=list(range(2,51))),
        true=folder2+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat8",
    output:
        f2plot="plots/supplementary/Ne{Ne}_split_times{sp}_npop{npop}_nind{nind}_mu{mu}_f2_plot_scale_test_ind.png"
    script:
        "Rscripts/scale_f2.R"

rule supp_method_comparison_ideal:
    input:
        flist=expand(folder1 + "simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/avgAccuracy_{vals}_scale{{npcs}}", vals=["PCA1_val","ppca_direct_val","admixtools2Norm"]),
        fscale2=folder1 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/avgAccuracy_ppca_direct_val_scale{npcs2}",
        pscale2=folder1 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/avgAccuracy_PCA1_val_scale{npcs2}",
        slist=expand(folder1 + "simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/stdDev_{vals}_scale{{npcs}}", vals=["PCA1_val","ppca_direct_val","admixtools2Norm"]),
        s_scale2=folder1 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/stdDev_ppca_direct_val_scale{npcs2}",
        p_scale2=folder1 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/stdDev_PCA1_val_scale{npcs2}",
        true=folder1 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat15"
    output:
        f2plot="plots/simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f2_plot_slides.png"
    script:
        "Rscripts/plot_f2.R"

rule supp_method_comparison_1ind:
    input:
        flist=expand(folder2 + "simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/avgAccuracy_{vals}_scale{{npcs}}", vals=["PCA1_val","ppca_direct_val","admixtools2Norm"]),
        fscale2=folder2 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/avgAccuracy_ppca_direct_val_scale{npcs2}",
        pscale2=folder2 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/avgAccuracy_PCA1_val_scale{npcs2}",
        slist=expand(folder2 + "simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/stdDev_{vals}_scale{{npcs}}", vals=["PCA1_val","ppca_direct_val","admixtools2Norm"]),
        s_scale2=folder2 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/stdDev_ppca_direct_val_scale{npcs2}",
        p_scale2=folder2 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/stdDev_PCA1_val_scale{npcs2}",
        true=folder2 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat15"
    output:
        f2plot="plots/simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f2_plot_slides_1ind.png"
    script:
        "Rscripts/plot_f2.R"

import python_scripts as py


folder1="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE/"
folder2="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE_1ind/"
folder3="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/Fig_comparison_PCA_PPCA_LSE_1ind_missing/"
folder4="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/block_jackknife_miss/"
folder5="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/neandertal_shrinkage/"

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

rule supp_pc_explained_sim_supplementary:
    input:
        ppcaf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/pcs_method_ppca_direct/pcs_npcs8.csv",
        indf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/eigen_pop.ind"
    output:
        pcplot1 = "plots/supplementary/pcplot1_8pc.png",
        pcplot2 = "plots/supplementary/pcplot2_8pc.png"
    script:
        "Rscripts/supp_fig_plot_8pc.R"

rule supp_pc_explained_sim_main:
    input:
        ppcaf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/pcs_method_ppca_direct/pcs_npcs8.csv",
        indf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/eigen_pop.ind"
    output:
        pcplot1 = "plots/supplementary/pcplot1.png",
        pcplot2 = "plots/supplementary/pcplot2.png"
    script:
        "Rscripts/supp_fig_plot.R"


rule supp_pc_explained_sim_pca:
    input:
        ppcaf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/pcs_method_pca/pcs_npcs8.csv",
        indf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/eigen_pop.ind"
    output:
        pcplot1 = "plots/supplementary/pcaplot1.png",
        pcplot2 = "plots/supplementary/pcaplot2.png"
    script:
        "Rscripts/supp_fig_plot_pca.R"

rule supp_pc_explained_sim_lse:
    input:
        ppcaf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/pcs_method_PCA1/pcs_npcs8.csv",
        indf = folder1 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/eigen_pop.ind"
    output:
        pcplot1 = "plots/supplementary/lseplot1.png",
        pcplot2 = "plots/supplementary/lseplot2.png"
    script:
        "Rscripts/supp_fig_plot_lse.R"


rule Fig_PCA_PPCA_LSE_scales:
    input:
        flist=expand(folder1+"simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/avgAccuracy_{vals}_scale{npcs}", vals=["PCA1_val","pca_val","ppca_direct_val"], npcs=list(range(2,51))),
        slist=expand(folder1+"simfiles/Ne{{Ne}}/split_times{{sp}}/mu{{mu}}/average_run/npop{{npop}}_nind{{nind}}/stdDev_{vals}_scale{npcs}", vals=["PCA1_val","pca_val","ppca_direct_val"], npcs=list(range(2,51))),
        true=folder2+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat8",



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

rule supp_method_comparison_iind:
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

rule one_plot:
    input:
        f2f=folder1+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f2.csv",
        f3f=folder1+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f3.csv",
        f4f=folder1+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f4.csv",
        true_f2=folder1+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat15",
        ftrue=folder1+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/fstats_avg_true_val"
    output:
        plotf="plots/simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_plot_all.png"
    script:
        "Rscripts/plot_all.R"

rule one_plot_1ind:
    input:
        f2f=folder2+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f2.csv",
        f3f=folder2+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f3.csv",
        f4f=folder2+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_f4.csv",
        true_f2=folder2+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat15",
        ftrue=folder2+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/fstats_avg_true_val"
    output:
        plotf="plots/simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/plots_{npcs}_{npcs2}/mu{mu}_plot_all_1ind.png"
    script:
        "Rscripts/plot_all.R"

rule one_plot_1ind_missing:
    input:
        f2f=folder3+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/missing{miss}/plots_{npcs}_{npcs2}/mu{mu}_f2.csv",
        f3f=folder3+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/missing{miss}/plots_{npcs}_{npcs2}/mu{mu}_f3.csv",
        f4f=folder3+"simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/missing{miss}/plots_{npcs}_{npcs2}/mu{mu}_f4.csv",
        true_f2=folder3+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat15",
        ftrue=folder3+"simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/missing{miss}/fstats_avg_true_val"
    output:
        plotf="plots/simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/missing{miss}/plots_{npcs}_{npcs2}/mu{mu}_plot_all_1ind_missing.png"
    script:
        "Rscripts/plot_all_missing.R"

rule one_plot_supp_table:
    input:
        plotf1 = folder1 + "simfiles/Ne1000/split_times1000/npop10_nind100/plots_8_12/mu0.05_f2.csv",
        plotf2 = folder2 + "simfiles/Ne1000/split_times1000/npop10_nind100/plots_8_12/mu0.05_f2.csv",
        plotf3 = folder3 + "simfiles/Ne1000/split_times1000/npop10_nind100/missing0.5/plots_8_12/mu0.05_f2.csv",
        plotf4 = folder1 + "simfiles/Ne1000/split_times1000/npop10_nind100/plots_8_12/mu0.05_f3.csv",
        plotf5 = folder2 + "simfiles/Ne1000/split_times1000/npop10_nind100/plots_8_12/mu0.05_f3.csv",
        plotf6 = folder3 + "simfiles/Ne1000/split_times1000/npop10_nind100/missing0.5/plots_8_12/mu0.05_f3.csv",
        plotf7 = folder1 + "simfiles/Ne1000/split_times1000/npop10_nind100/plots_8_12/mu0.05_f4.csv",
        plotf8 = folder2 + "simfiles/Ne1000/split_times1000/npop10_nind100/plots_8_12/mu0.05_f4.csv",
        plotf9 = folder3 + "simfiles/Ne1000/split_times1000/npop10_nind100/missing0.5/plots_8_12/mu0.05_f4.csv",
        truef = folder1+"simfiles/Ne1000/split_times1000/mu0.05/avgrun/npop10_nind100/true_val/f2mat15"
    output:
        s="supplementary_table/table1.csv"
    run:
        py.maketable(f2_1=input.plotf1, f2_2=input.plotf2, f2_3=input.plotf3, f3_1=input.plotf4, truef=input.truef,
        f3_2=input.plotf5, f3_3=input.plotf6, f4_1=input.plotf7, f4_2=input.plotf8, f4_3=input.plotf9, outfile=output.s)


rule admixplot_f4:
    input:
        fname=folder4 + "simfiles/AvgFolder/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/missing{miss}/ppca_miss_val_scale{npcs}/ll.csv"
    output:
        fout="plots/simfiles/AvgFolder/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/missing{miss}/plots_{npcs}/hypothesis_test_comparison.png"
    script:
        "Rscripts/plot_comp.R"

rule admix_all:
    input:
        a1="plots/simfiles/AvgFolder/Ne1000/split_times1000/npop10_nind100/missing0/plots_8/hypothesis_test_comparison.png",
        a2="plots/simfiles/AvgFolder/Ne1000/split_times1000/npop10_nind100/missing0.5/plots_8/hypothesis_test_comparison.png"

rule nea_pca:
    input:
        ppcaf=folder5+"nea.evec",
        ppcaf1=folder5+"filter3/pcs_ppca_miss/pcs_npcs2.csv",
        indf=folder5+"all_ind.ind"
    output:
        outplot1="plots/neandertal_pca_smartpca.png",
        outplot2="plots/neandertal_ppca.png"
    params:
        n_pcs=2
    script:
        "Rscripts/neandertal_ppca_pca.R"

rule nea_f3:
    input:
        admf=folder5+"admixtools2/f3stats.csv",
        ppca_muf=folder5+"ppca_miss_val_scale2/mu.csv",
        ppca_stdf=folder5+"ppca_miss_val_scale2/std.csv"
    output:
        plotf="plots/f3_neandertal.png"
    script:
        "Rscripts/plot_f3.R"

rule main_fig_all_pca:
    input:
        x1 = folder1 + "simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/mu{mu}_f2_fig_all.csv",
        x2 = folder2 + "simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/mu{mu}_f2_fig_all.csv",
        x3 = folder3 + "simfiles/Ne{Ne}/split_times{sp}/npop{npop}_nind{nind}/missing{miss}/mu{mu}_f2_fig_all.csv",
        truef = folder1 + "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/avgrun/npop{npop}_nind{nind}/true_val/f2mat8",
        nfile_avg1 = folder1+ "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/avgAccuracy_noisy_val_scale8",
        nfile_avg2 = folder2+ "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/avgAccuracy_noisy_val_scale8",
        nfile_avg3 = folder3+ "simfiles/Ne{Ne}/split_times{sp}/mu{mu}/average_run/npop{npop}_nind{nind}/missing{miss}/avgAccuracy_noisy_val_scale8"

    output:
        f2plot="plots/simfiles_Ne{Ne}_split_times{sp}/npop{npop}_nind{nind}/missing{miss}/mu{mu}_main_fig_all_pca.png"
    script:
        "Rscripts/main_fig_pca_all_moredata.R"

rule supp_lse_admix:
    input:
        admixf=folder2 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/admixtools2Norm/f2mat102",
        truef="/mnt/diversity/divyaratan_popli/fstats/genetic_simulations/test_samplesize100/simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/true_val/f2mat",
        lsef=expand(folder2 + "simfiles/Ne1000/split_times1000/mu0.05/run1/npop10_nind100/PCA1_val/f2mat{npcs}", npcs=list(range(2,105)))
    output:
        outplotf="plots/supplementary/lse_admix.png"
    script:
        "Rscripts/supp_lse_admixtools.R"




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

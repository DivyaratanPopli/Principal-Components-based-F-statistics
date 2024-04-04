This is a statistical framework to infer ancient relatedness between individuals or populations by estimating the genetic distances between them. Our framework provides the link between two widely used methods, principal component analysis (PCA) and F-statistics, which are routinely used in population genetic and archaeogenetic studies. PCA is a dimentionality reduction technique that is used for visualizing structure in populations, and for forming hypotheses about past admixtures. In many studies, PCA is followed by statistical testing for admixture using methods based on a set of statistics called F-statistics. It has been shown that PCA and F-statistics are closely related analyses and reveal the same biological signal. Many ancient genetic studies use both of these tools, but make slightly different assumptions, using slightly different models and different software for them.

Thus, we combine PCA and F-statistics into a joint analysis. This framework allows us to ensure that the assumptions for PCA and F-statistics are consistent throughout the analysis. The key advantage is that the effect of modelling assumptions becomes apparent, and this also allows us to make novel recommendations about how PCA-based analyses should be performed and interpreted. The connections between F-statistics and PCA allow us to provide a better understanding on how different PCA algorithms emphasize population structure versus sampling noise.

Here, we provide different implementations of PCA - probabilistic PCA (PPCA), Latent Subspace Estimation (LSE) and classical PCA - and find that F-statistics are more naturally interpreted in a PPCA or LSE-based framework. Using this framework, F-statistics can be accurately estimated from PPCA in the presence of large amounts of missing data.

A Snakemake pipeline to run our framework will be publically available soon.
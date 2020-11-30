
#THE GOAL FOR THIS DOCUMENT IS TO GET THE "PROJECT" OBJECT NECESSARY TO RUN "n = dim(Q(project, run, optimal_K))[1]" in 2.filter.Rmd 


#------------------------------------------------------------------------------
#                      6. Filtering Neutral Loci - Part II - sNMF 
#------------------------------------------------------------------------------
# sNMF - sparse Nonnegative matrix factorization (NMF) for Estimation of Individual Ancestry Coefficients similar to STRUCTURE and ADMIXTURE.
# STRUCTURE and ADMIXTURE assumptions include absence of genetic drift and Hardy–Weinberg and linkage equilibrium in ancestral populations. sNMF was more appropriate to deal with inbred lineages. sNMF enabled the estimation of homozygote and heterozygote frequencies and avoided Hardy–Weinberg equilibrium assumptions. Cross-entropy criterion indicated better predictive results for sNMF than for ADMIXTURE. You can use impute() to predict Ancestry Coefficients for missing values.
#-------------------------------------------------------------------------------

###6.1. CREATE A geno OBJECT:
#A. Load the .VCF file with only neutral SNPs:
snps_sNMF = vcfLink(paste0("vcf/", project_name,"_filtered_neutral_partial.vcf"), overwriteID=T)
VCFsummary(snps_sNMF) ##16 individuals and 100 SNPs.

#B. Convert VCF to geno object. You need to specify the output file. It will automatically subset the vcf file and assign it as a new object.
snps_sNMF = Geno(snps_sNMF, output.file = paste0("./Results_Filters/sNMF_FST/", project_name, "_filtered_neutral_partial.geno"))
VCFsummary(snps_sNMF) ##16 individuals and 100 SNPs.

#C. Choose the 6 values of alpha. Alpha is the value of the regularization parameter (by default: 10). The results can depend on the value of this parameter, especially for small data sets. Less than 10,000 SNPs you can use values from 1000 to 10000. More than 10,000 SNP between 1 to 2,000. You can test different values.

# < 10,000 SNPs (higher values of alpha)
alpha_values = c(1000, 2000, 4000, 6000, 8000, 10000)

#D. Create folders for alpha values and copy .geno object in each folder:
for (i in alpha_values){
  path = paste0("./Results_Filters/sNMF_FST/Alpha", i)
  if (dir.exists(file.path(getwd(), path)) == FALSE)
  {dir.create(path, recursive = T, showWarnings = F)} else (print (paste0(path, " has already been created. Be careful with overwritting")))
  file.copy(paste0("./Results_Filters/sNMF_FST/", project_name, "_filtered_neutral_partial.geno"), path )
}

#E. Set parameters to run SNMF (LEA) using different alpha values.
K_sNMF = c(1:10) # set the number of K to be tested
replications_sNMF = 5 # number of replication in each K
ploidy_sNMF = 2 # species ploidy
CPU_sNMF = 4 #Number of cores for run in parallel

###6.2. RUN sNMF (LEA)
#A.Run a loop for all alpha values 
loop = 0 #set ALWAYS as 0.
for (i in alpha_values){
  loop = loop +1
  path = paste0("./Results_Filters/sNMF_FST/Alpha", i,"/", project_name, "_filtered_neutral_partial.geno")
  pro_snmf = snmf(path, K = K_sNMF, rep = replications_sNMF, alpha = i, entropy = T, ploidy = ploidy_sNMF , project = "new", CPU= CPU_sNMF)
  assign(paste0("project_snmf", loop), pro_snmf)
}

#B. To load the SNMF projects. This allows you to save time because you do not need to run SNMF again!
loop = 0 #set ALWAYS as 0.
for (i in alpha_values){
  loop = loop +1
  path = paste0("./Results_Filters/sNMF_FST/Alpha", i,"/", project_name, "_filtered_neutral_partial.snmfProject")
  pro_snmf = load.snmfProject(path)
  assign(paste0("project", loop), pro_snmf)
}

#C. Summary of the project
summary(project1)
summary(project2)
summary(project3)
summary(project4)
summary(project5)
summary(project6)

#D. View cross-Entropy plot
PlotK(project1) #5
PlotK(project2) #5
PlotK(project3) #5
PlotK(project4) #4
PlotK(project5) #4
PlotK(project6) #5

#E. Save Cross-Entropy plot with standard deviation error bars
for (i in alpha_values){
  pdf(paste0("./Results_Filters/sNMF_FST/Cross_Entropy_sNMF_Alpha_",  i, ".pdf"), onefile = F)
  path = paste0("./Results_Filters/sNMF_FST/Alpha", i,"/", project_name, "_filtered_neutral_partial.snmfProject")
  print(PlotK(load.snmfProject(path)))
  dev.off()
}

#F. Select optimal K value (smallest cross-entropy value consistent across all alpha values)
optimal_K_sNMF = 1

#G. ATTENTION, if your dataset is K = 1 force a K = 2 to be able to filter SNPs with FST outliers.

#H. Select best run (lowest cross-entropy)  
best_run = Best.run(nrep=replications_sNMF, optimalK=optimal_K_sNMF, p1=project1, p2=project2, p3=project3, p4=project4, p5=project5, p6=project6)
#load the best project
best_run_split = scan(text = best_run, what = "")
path_best_run = paste0("./Results_Filters/sNMF_FST/Alpha", alpha_values[as.numeric(best_run_split[6])],"/", project_name, "_filtered_neutral_partial.snmfProject")
#set the values
project = load.snmfProject(path_best_run)
run=as.numeric(best_run_split[9])

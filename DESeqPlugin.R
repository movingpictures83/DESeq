library(DESeq2)
input <- function(inputfile) {
   parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
  cnts <<- as.matrix(read.csv(toString(parameters["abundances",2])))
  cond <<- as.vector(read.csv(toString(parameters["groups",2])))
  cnts <<- cnts[,-1]
  cond <<- factor(cond[,-1])
}

run <- function() {
  dds <<- DESeqDataSetFromMatrix(cnts, DataFrame(cond), ~cond)
  dds <<- DESeq(dds)
  ddsLRT <<- DESeq(dds, test="LRT", reduced = ~ 1)
}

output <- function(outputfile) {
  resLRT <- results(ddsLRT)
  write.csv(as.matrix(resLRT), outputfile)
}

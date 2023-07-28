dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


library(DESeq2)
input <- function(inputfile) {
  pfix = prefix()
  if (length(pfix) != 0) {
     pfix <- paste(pfix, "/", sep="")
  }
   parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
  cnts <<- as.matrix(read.csv(paste(pfix, toString(parameters["abundances",2]), sep="")))
  cond <<- as.vector(read.csv(paste(pfix, toString(parameters["groups",2]), sep="")))
  cnts <<- cnts[,-1]
  cnts <<- apply(cnts, 1, as.numeric);
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

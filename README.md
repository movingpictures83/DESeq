# Language: R
# Input: TXT (keyword-value pairs)
# Output: CSV (statistics on each gene)
# Tested with: PluMA 1.0, R 4.0

PluMA plugin to compare two sets of samples and discover the most distiniguishing genes, computed using Differential Gene Expression Analysis Based on the Negative Binomial Distribution (Love et al, 2014).

The plugin takes as input a TXT file of keyword, value pairs, tab-delimited:
abundances: CSV file where rows represent genes and columns represent samples, with entry (i, j) representing the expression of gene i in sample j
groups: CSV file where rows represent samples and columns represent group numbers (i.e. 1, 2)

The plugin will then output a CSV file where rows represent genes, and columns represent statistics on each gene (i.e., their log-fold change between groups).


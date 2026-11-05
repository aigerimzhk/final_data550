data/cleveland_clean.rds: data/processed.cleveland.data code/data_cleaning_code.R
	Rscript code/data_cleaning_code.R

output/table1.rds: data/cleveland_clean.rds code/code_table1.R
	Rscript code/code_table1.R

output/figure1.rds: data/cleveland_clean.rds code/code_figure1.R
	Rscript code/code_figure1.R

Heart-Disease-Report.html: Heart-Disease-Report.Rmd render_report.R output/table1.rds output/figure1.rds
	Rscript render_report.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Heart-Disease-Report.html
# Code Description


`code/clean_data.R`
- loads and cleans the Cleveland Heart Disease dataset
- saves the cleaned dataset as a  `.rds` object in the `data/` folder

`code/table1.R`
- generates table 1 with participant characteristics
- saved as a `.rds` object in the `output/` folder

`code/figure1.R`
- generates a figure showing age and ST depression by heart disease status
- saved as a `.rds` object in the `output/` folder


`code/render_report.R`
-renders the R Markdown file to create a report


`Heart-Disease_Report.Rmd`
- contains the report introduction, table and figure

# To create a report

- run `make Heart-Disease-Report.html`

This generates the final HTML report, which compares patient characteristics 
by heart disease status and examines the relationship between age and ST depression
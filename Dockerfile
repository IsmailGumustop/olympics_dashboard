FROM rocker/shiny

RUN mkdir /home/shiny-app

RUN R -e 'install.packages(c("shiny", "shinyWidgets", "DT", "dplyr", "tidyr", "bslib", "bsicons", "plotly", "remotes"))'
RUN R -e 'remotes::install_github("mitchelloharawild/icons", force = TRUE, dep = TRUE)'

# Copy the Shiny app code
COPY ./ /home/shiny-app

WORKDIR /home/shiny-app

# Expose the application port
EXPOSE 8180

# Run the R Shiny app
CMD Rscript /home/shiny-app/app.R
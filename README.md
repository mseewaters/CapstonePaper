# CapstonePaper
Data preparation and modeling for The Protectors NYU Stern MSBA Capstone

This repository include the relevent files for the child abduction data preparation
modeling, and shinyapp development

Data preparation:
2012-NIBRS.py             Python file to extract abduction incidents from raw crime data
NIBRS_dataclean_vicoff.R  File to complete data processing, output supports model development
NIBRS_correlation.R       File to isolate demongraphic attributes of interest

Model development:
NIBRS_sampling2.R     All model screening, feature selection, etc for paper
NIBRS_modelbuild.R    Final model build for Shiny

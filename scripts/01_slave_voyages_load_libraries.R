# ─────────────────────────────────────────────────────────────
# Script: 01_slave_voyages_load_libraries.R
# Purpose: Load all required packages for the Slave Voyages data cleaning workflow
# Author: Edward Parlati
# Last updated: April 17, 2025
# Project: Slave Voyages Completeness Assessment
# GitHub: https://github.com/edwardparlati/slave-voyages-completeness-audit
# ─────────────────────────────────────────────────────────────
# Description:
# This script loads all required libraries used throughout the data cleaning and preparation process.
# It checks whether each package is installed, installs it if missing, and loads it into the session.
#
# Key tasks:
# - Ensure packages like haven, readr, tidyverse, and dplyr are available
# - Prepare the environment for subsequent scripts
# - Support reproducibility across environments
#
# Output:
# - Loaded libraries for use throughout the pipeline
# ─────────────────────────────────────────────────────────────

### Load libraries
if (!requireNamespace("haven", quietly = TRUE)) install.packages("haven")
library(haven)
if (!requireNamespace("readr", quietly = TRUE)) install.packages("readr")
library(readr)
if (!requireNamespace("tidyverse", quietly = TRUE)) install.packages("tidyverse")
library(tidyverse)
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
library(dplyr)
if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")
library(lubridate)
if (!requireNamespace("dm", quietly = TRUE)) install.packages("dm")
library(dm)
if (!requireNamespace("DiagrammeR", quietly = TRUE)) install.packages("DiagrammeR")
library(DiagrammeR)
if (!requireNamespace("DiagrammeRsvg", quietly = TRUE)) install.packages("DiagrammeRsvg")
library(DiagrammeRsvg)
if (!requireNamespace("rsvg", quietly = TRUE)) install.packages("rsvg")
library(rsvg)

# ── End of 01_slave_voyages_load_libraries.R ──
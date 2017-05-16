#!/usr/bin/env ruby

# This script determines the name of the project.
#
# 1. `PROJECT_NAME` environment variable.
#
# 2. Name of the only pdf in the project directory.
#
# 3. Directory structure.
#
#        ~/projects/thesis/latex/thesis.tex
#                   ~~~~~~
#
# 4. Default: "main"

def project_name
  environment_variable || pdf_name || project_folder_name || default_name
end

def environment_variable
  ENV['PROJECT_NAME']
end

def pdf_name
  pdfs.first.split("/").last.gsub(".pdf", "") if pdfs.count == 1
end

def pdfs
  @pdfs ||= Dir.glob("#{latex_directory}/*.pdf")
end

def project_folder_name
  if latex_directory.split("/").last.downcase == "latex"
    latex_directory.split("/")[-2]  # use the parent folder
  else
    latex_directory.split("/").last
  end
end

def latex_directory
  @latex_directory ||= File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
end

def default_name
  "main"
end

print project_name
